Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'reports#index'
  resources :reports do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'artists'
    end
    member do
      get 'artist_show'
    end
  end
  resources :users, only: [:show, :destroy]
end
