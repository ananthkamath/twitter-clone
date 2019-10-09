Rails.application.routes.draw do
  get 'home', to: 'pages#home'
  get 'explore', to: 'pages#explore'
  get 'notifications', to: 'pages#notifications'
  get 'messages', to: 'pages#messages'
  post 'likes/toggle'
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :tweets
  resources :profiles, only: [:show, :new, :edit, :create, :update]
  resources :relationships, only: [:create, :destroy]
  root to: 'pages#home'
end
