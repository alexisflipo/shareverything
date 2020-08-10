Rails.application.routes.draw do
  get 'links_code/show'
  get 'links_code/create'
  get 'senders/new'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sender, only: :new
  resources :link, only: [:show, :create]
end
