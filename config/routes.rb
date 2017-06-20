Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :headbands, only: [:index]
  resources :principes, only: [:index]
  resources :abouts, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
