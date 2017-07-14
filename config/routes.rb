Rails.application.routes.draw do
  get '/profile/:id', to: 'profile#show', as: 'profile'

  get '/albums/:id', to: 'albums#show', as: 'albums'

  get 'main_feed/show'

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

  root 'main_feed#show'
end
