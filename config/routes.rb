Rails.application.routes.draw do
  root to: 'reports#index'
  resources :reports, only: [:index]
end
