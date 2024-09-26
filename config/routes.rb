Rails.application.routes.draw do
  root 'home#index'

  get "posts/index"
  get "posts/show"
  get "posts/new"
  get "posts/create"
  get "posts/edit"
  get "posts/update"
  get "posts/destroy"

  get "home/index"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "sessions/login"
  get "sessions/logout", to: "sessions#destroy"
  get "sessions/attempt_logout"
  post "sessions/attempt_login"

  get "users/index"
  get "users/new"
  post "users/create"
  get "users/edit"
  get "users/delete"

  # get 'login', to: 'sessions#login', as: 'login'
  # get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
  resources :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
