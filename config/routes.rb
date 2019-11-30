Rails.application.routes.draw do
  get 'users/profile'
  root to: 'pages#home'
  get 'pages/about'
  
  post 'offerings/booking(/:id)', to: 'offerings#book', :as => 'offerings_booking'
  get 'offerings/bookings'

  resources :offerings
  resources :billings

  devise_for :users
  
  resources :courses do
    resources :posts do
      resources :comments
    end
  end

  get '/search' => 'courses#search', :as => 'search_page'
  get 'repos/search' => 'repos#search', :as => 'search_repo'
  post'courses/join_action', :as => 'join_course'

  resources :repos do
    resources :items do
      get :download_file
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
