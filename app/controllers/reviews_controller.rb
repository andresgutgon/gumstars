class ReviewsController < ApplicationController
  before_action :product, only: %i[index new create]

  def new
    @review = Review.new(product: @product)
  end

  def create
    @review = @product.reviews.new(
      new_review_params.merge(product: @product)
    )

    respond_to do |format|
      if @review.save
        @average_rating = product.reviews.average(:rating)
        @reviews = @product.reviews.order(created_at: :desc)
        format.turbo_stream
        format.html { redirect_to @product }
      else
        flash.now[:messages] = @review.errors.full_messages
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
