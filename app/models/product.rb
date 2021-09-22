class Product < ApplicationRecord
  before_validation :generate_slug, on: :create

  # Relations
  has_many :reviews

  # Validations
  validates :name, :slug, presence: true

  # Method used to generate Rails route by :slug insted of :id
  # /products/some-slug instead of /product/33
  def to_param
    slug
  end

  private

  # Dummy slug generating.
  # This implementation doesn't take into account unicode spectrum fully
  # is just a simple implementation for this demo
  def generate_slug
    self.slug = name.dasherize.parameterize
  end
end
