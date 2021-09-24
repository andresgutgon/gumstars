module ReviewsHelper
  def rating_format(rating)
    number_with_precision(
     (rating.to_f / 10).to_f,
      precision: 1,
      strip_insignificant_zeros: true
    )
  end

  def stars(rating:, full_stars: false)
    render(
      partial: "reviews/shared/stars",
      locals: {
        rating: rating,
        full_stars: full_stars,
        stars: Review::VALID_RATINGS.in_groups(
          Review::VALID_RATINGS.size / 2
        )
      }
    )
  end
end
