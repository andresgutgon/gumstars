class ApplicationController < ActionController::Base

  # Copied from here:
  # https://github.com/ledermann/pingcrm/blob/master/app/controllers/application_controller.rb#L6
  include InertiaCsrf

  inertia_share(
    stars: Review.stars_in_halfs,
    starsReverse: Review::VALID_RATINGS.reverse
  )
end
