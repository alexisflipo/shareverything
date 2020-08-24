Rails.application.routes.draw do
  require "sidekiq/web"

  mount Sidekiq::Web => '/sidekiq'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :senders, only: [:new, :create]
  resources :documents, param: :url, only: [:show]

  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unacceptable'
  get '/500', to: 'errors#server_error'
end
