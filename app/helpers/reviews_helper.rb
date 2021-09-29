module ReviewsHelper
  def rating_format(rating)
    number_with_precision(
     (rating.to_f / 10).to_f,
      precision: 1,
      strip_insignificant_zeros: true
    )
  end

  def stars(rating:, full_stars: false, as: 'div')
    render(
      partial: "reviews/shared/stars",
      locals: {
        as: as,
        rating: rating,
        full_stars: full_stars,
        stars: stars_in_halfs
      }
    )
  end

  # Group all possible ratings: 0.5, 1, 1.5, 2, 2.5...
  # in groups like [0.5, 1], [1.5, 2],...
  # This way we can show half star at the start or the end
  def stars_in_halfs
    @starts_in_halfs ||= Review::VALID_RATINGS.in_groups(
      Review::VALID_RATINGS.size / 2
    )
  end
end
