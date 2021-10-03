module ReviewsHelper
  def switcher_classes(is_active)
    base = %w[border-2 rounded flex items-center space-x-1 py-1 pl-2 pr-4]
    all = is_active ? base + %w[border-blue-800] : base + %w[border-gray-300]
    all.join(' ')
  end

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
        stars: Review.stars_in_halfs
      }
    )
  end
end
