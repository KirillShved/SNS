Rails.application.routes.draw do

  resources :albums do
    resources :photos
  end
  get 'profile/index'

  get 'main_feed/index'

  get 'albums/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main_feed#index'
end
