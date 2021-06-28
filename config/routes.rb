Rails.application.routes.draw do
  devise_for :users
  root to: 'reports#index'
  resources :reports
end
