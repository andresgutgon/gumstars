class ProductsController < ApplicationController
  def index
    @products = collection.fetch
  end

  def show
    @product = collection.fetch.find_by!(slug: params[:slug])
    @reviews = @product.reviews.order(created_at: :desc)
    @average_rating = @reviews.average(:rating) || 0
  end

  def collection
    @collection ||= ProductsCollection.new
  end
end
