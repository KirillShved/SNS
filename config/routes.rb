Rails.application.routes.draw do
  get '/profile/:id', to: 'profile#index', as: 'profile'

  get 'main_feed/index'

  get 'albums/index'

  devise_for :users

  resources :relationships

  resources :users, shallow: true do

    member do
      get :following, :followers
    end

    resources :albums do
      resources :photos
    end
  end

  root 'main_feed#index'
end
