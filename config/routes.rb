Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :senders, only: [:new, :create]
  resources :links, only: [:show, :create]
  resources :documents, only: [:show, :update]

  require "sidekiq/web"
    mount Sidekiq::Web => '/sidekiq'
end
