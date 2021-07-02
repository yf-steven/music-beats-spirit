Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'reports#index'
  resources :reports do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :destroy]
end
