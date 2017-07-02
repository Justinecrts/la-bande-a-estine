Rails.application.routes.draw do
  get 'orders/show'

  get 'orders/create'

  devise_for :users
  root to: 'pages#home'
  resources :headbands, only: [:index, :show]
  resources :carts, only: [:show]
  resources :orders, only: [:create, :show]

  resources :cartheadbands, only: [:destroy]
  get 'add_quantity/:cart_headband_id', to: 'cartheadbands#add_quantity', as: :add_quantity
  get 'remove_quantity/:cart_headband_id', to: 'cartheadbands#remove_quantity', as: :remove_quantity

  get 'add_item/:headband_id', to: 'carts#add_item', as: :add_item
  get 'pages/principle', to: 'pages#principle', as: :principle
  get 'pages/about', to: 'pages#about', as: :about
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
