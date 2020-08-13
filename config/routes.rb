Rails.application.routes.draw do
  require "sidekiq/web"
  
  mount Sidekiq::Web => '/sidekiq'
  
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :senders, only: [:new, :create]
  resources :documents, only: [:show] do
    member do
      get :download
    end
  end


end
