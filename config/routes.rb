Rails.application.routes.draw do
  get "users/new"
  get "users/create"

  # Sign Up Routes (p4 User Story)
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  #Authentication Routes (P3 User Story)
  get 'login', to:'sessions#new' # Displays the login form
  post 'login', to: 'sessions#create' # Submits the login form (handles happy/sad path logic)
  delete 'logout', to: 'sessions#destroy' # Logs the user out securely

  root "pages#index"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
