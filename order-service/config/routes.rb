Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root
  root to: 'home#index'

  resources :customers, only: [:index, :show, :create, :update, :destroy]
  resources :items, only: [:index, :show, :create, :update, :destroy]
  resources :orders, only: [:index, :show, :create, :update, :destroy]
  resources :order_lines, only: [:index, :show, :create, :update, :destroy]

  # for the health check
  get '/monitor', to: 'monitor#ping'
end
