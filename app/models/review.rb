class Review < ApplicationRecord
  VALID_RATINGS = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50].freeze

  # Relations
  belongs_to :product

  # Validations
  validates :rating, presence: true
  # NOTE: In a real app this message would be I18n, world is a diverse and multilingual place
  validates(
    :rating,
    inclusion: {
      in: VALID_RATINGS,
      message: "%{value} is not a valid rating. You can only put from 1 to 5 stars or half stars"
    }
  )
end
