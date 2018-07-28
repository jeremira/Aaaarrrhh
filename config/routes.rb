Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pirates#index'

  resources :pirates
  resources :fights, only: [:show, :index, :create]
end
