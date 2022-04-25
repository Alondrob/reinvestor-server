Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :properties
  resources :reports
  resources :sessions
  get '/current_user', to: 'current_user#index'

  post "/login", to: "users#login"
  get "/login", to: "users#token_authenticate"
end
