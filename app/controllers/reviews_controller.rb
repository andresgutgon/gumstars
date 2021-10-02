class ReviewsController < ApplicationController
  before_action :product, only: %i[index new create]

  def new
    @review = Review.new(product: @product)
  end

  def create
    @review = @product.reviews.new(
      new_review_params.merge(product: @product)
    )

    @average_rating = product.reviews.average(:rating)
    @reviews = @product.reviews.order(created_at: :desc)
    errors = @review.errors.full_messages
    saved = @review.save

    options = saved ? {} : { inertia: { errors: errors }}

    # React implementation use Inertia.js. In the backend you just submit
    # an AJAX request and redirect to the page where the form is
    # FIXME: Make this check based on params[:implementation] == 'react'
    return redirect_to product_path(@product), options if false

    respond_to do |format|
      if saved
        format.turbo_stream
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
