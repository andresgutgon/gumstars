class Review < ApplicationRecord
  VALID_RATINGS = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50].freeze

  # Relations
  belongs_to :product

  # Validations
  validates :comment, presence: true
  # NOTE: In a real app this message would be I18n, world is a diverse and multilingual place
  validates(
    :rating,
    inclusion: {
      in: VALID_RATINGS,
      message: "%{value} is not a valid rating. You can only put from 1 to 5 stars or half stars"
    }
  )

  class << self
    # Group all possible ratings: 0.5, 1, 1.5, 2, 2.5...
    # in groups like [0.5, 1], [1.5, 2],...
    # This way we can show half star at the start or the end
    def stars_in_halfs
      @starts_in_halfs ||= Review::VALID_RATINGS.in_groups(
        Review::VALID_RATINGS.size / 2
      )
    end
  end
end
