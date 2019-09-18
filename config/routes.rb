Rails.application.routes.draw do
  post 'likes/toggle'
  devise_for :users
  resources :tweets
  resources :profiles, only: [:show, :new, :edit, :create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
end
