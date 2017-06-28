Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :headbands, only: [:index, :show]
  resources :carts, only: [:show]
  get 'pages/principle', to: 'pages#principle', as: :principle
  get 'pages/about', to: 'pages#about', as: :about
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
