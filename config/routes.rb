Rails.application.routes.draw do
  resources :pins do
    resources :comments, only: [ :create ]
    # Al remover only: [ : ], resources :pins obtiene acceso a todas sus acciones RESTful
    resource :like, only: [ :create, :destroy ]
    # Se usa "resource" porque un usuario solo puede tener un "Me Gusta" por foto.
  end

  devise_for :users
  resources :users, only: [ :show ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pins#index" # Que la página de inicio sea el listado de pins (entradas por foto)
end
