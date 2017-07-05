Rails.application.routes.draw do
  get 'profile/index'

  get 'main_feed/index'

  get 'albums/index'

  devise_for :users

  resources :users, shallow: true do
    resources :albums do
      resources :photos
    end
  end

  root 'main_feed#index'
end
