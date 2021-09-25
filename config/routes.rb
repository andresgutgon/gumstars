Rails.application.routes.draw do
  # Administrative routes
  # More info:
  # https://github.com/thoughtbot/administrate
  namespace :admin do
    resources :products
    resources :reviews

    root to: "products#index"
  end

  resources :products, param: :slug do
    resources :reviews
  end
  root 'welcome#index'
end
