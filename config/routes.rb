Rails.application.routes.draw do
  # Administrative routes
  # More info:
  # https://github.com/thoughtbot/administrate
  namespace :admin do
    resources :products
    resources :reviews

    root to: "products#index"
  end

  resources :products, only: %i[show], param: :slug do
    resources :reviews, only: %i[new create]
  end

  root 'products#show'
end
