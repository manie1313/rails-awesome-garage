Rails.application.routes.draw do
  # post 'favourites/create'
  # get 'favourites/destroy'
  # get 'reviews/create'
  # get 'cars/index'
  # get 'cars/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root "cars#index"

  resources :cars, only: %i[index show] do
    resources :reviews, only: [:create]
    resources :favourites, only: [:create]
    end
  resources :favourites, only: %i[index destroy]
end


# bundle and bundle install bash is the same
