class ProductsController < ApplicationController
  def show
    @implementation = params[:implementation] || 'vanillajs'
    slug = params[:slug]

    # NOTE: Hack to avoid having a default home
    return redirect_to product_path(slug: 'the-minimalist-entrepreneur') if slug.nil?

    @product = collection.fetch.find_by!(slug: slug)
    @reviews = @product.reviews.order(created_at: :desc)
    @average_rating = @reviews.average(:rating) || 0

    if @implementation == 'react' || params[:inertia]
      render(
        inertia: 'Product/Show',
        props: {
          product: @product.as_json(only: %i[id name slug]),
          averageRating: @average_rating.to_f,
          stars: Review.stars_in_halfs,
          reviews: @reviews,
          # Note: Rails routes can be generated in javascript with something like this.
          # https://github.com/railsware/js-routes # Rails routes can be generated in javascript with something like this. https://github.com/railsware/js-routes
          # Not using in this project only for 1 shared route
          createReviewApiPath: product_reviews_path(@product, implementation: 'react')
        }
      )
    end
  end

  private

  def collection
    @collection ||= ProductsCollection.new
  end
end
