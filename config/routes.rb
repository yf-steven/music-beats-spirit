Rails.application.routes.draw do
  devise_for :users
  root to: 'reports#index'
  resources :reports
  resources :users, only: [:show, :destroy]
end
