class ProductsCollection
  def initialize(user: nil, shop: nil)
    @user = user
    @shop = shop
  end

  # DISCLAIMER
  # This is a dummy (doing nothing) implementation of a service that
  # get the products for a shop.
  #
  # This is not at all necesary on a public store where everybody can see all
  # the products. But in general I prefer to have a service that handle visibility
  # of the items on a table that can be seen for a user
  #
  # The idea is to do an scope in this method like this:
  # Product.by_user(shop).for_user(user)
  #
  # Again, this implementation is super dumb but I wanted to reflect my concern
  # with using raw ActiveRecord access on controllers. Usually always there is some kind of
  # tenant like a `shop` where products point. And also some visibility rules like only see
  # products created by the user unless user is the admin.
  #
  # By using a service like this is easy to keep in once place these rules and use in
  # several controllers or other services.
  #
  # I'm talk to discuss about this if is not clear : )
  def fetch
    Product.includes(:reviews).all
  end

  private

  attr_reader :user, :shop
end
