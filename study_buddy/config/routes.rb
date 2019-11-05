Rails.application.routes.draw do
  get 'users/profile'
  root to: 'pages#home'
  get 'pages/about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
