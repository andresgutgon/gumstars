class ProductsController < ApplicationController
  def index
    @products = collection.fetch
  end

  def show
    @product = collection.fetch.find_by!(slug: params[:slug])
  end

  def collection
    @collection ||= ProductsCollection.new
  end
end
