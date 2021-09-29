class ProductsController < ApplicationController
  def show
    slug = params[:slug]
    return redirect_to product_path(slug: 'the-minimalist-entrepreneur') if slug.nil?

    @product = collection.fetch.find_by!(slug: slug)
    @reviews = @product.reviews.order(created_at: :desc)
    @average_rating = @reviews.average(:rating) || 0
  end

  private

  def collection
    @collection ||= ProductsCollection.new
  end
end
