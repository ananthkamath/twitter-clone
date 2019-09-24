Rails.application.routes.draw do
  get 'home', to: 'pages#home'
  get 'user_profile', to: 'pages#profile'
  get 'explore', to: 'pages#explore'
  get 'notifications', to: 'pages#notifications'
  get 'messages', to: 'pages#messages'
  post 'likes/toggle'
  devise_for :users
  resources :tweets
  resources :profiles, only: [:show, :new, :edit, :create, :update]
  root to: 'pages#home'
end
