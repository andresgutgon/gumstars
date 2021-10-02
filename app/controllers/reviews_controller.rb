class ReviewsController < ApplicationController
  before_action :product, only: %i[index new create]

  def new
    @review = Review.new(product: @product)
  end

  def create
    @review = @product.reviews.new(
      new_review_params.merge(product: @product)
    )

    implementation = params[:implementation] || 'vanillajs'
    saved = @review.save
    errors = @review.errors.full_messages

    @average_rating = product.reviews.average(:rating)
    @reviews = @product.reviews.order(created_at: :desc)

    options = saved ? {} : { inertia: { errors: errors }}

    if implementation == 'react'
      if saved
        # Realtime in React implementation with ActionCable
        ActionCable.server.broadcast(
          'product',
          average_rating: @average_rating,
          reviews: @reviews
        )
      end
      return redirect_to(product_path(@product, implementation: implementation), options)
    end

    # Not react/Inertia code is standard Rails response
    respond_to do |format|
      if saved
        format.turbo_stream # Realtime in vanillajs is done inside this template
        format.html { redirect_to @product }
      else
        flash.now[:messages] = errors
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def new_review_params
    params.require(:review).permit(:rating, :comment)
  end

  def product
    @product ||= products_collection.fetch.find_by!(slug: params[:product_slug])
  end

  def products_collection
    @products_collection ||= ProductsCollection.new
  end
end
