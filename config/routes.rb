Rails.application.routes.draw do
  resources :characters
  devise_for :users
  root to: 'application#welcome'
end
