Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :properties
  resources :reports
  get '/current_user', to: 'current_user#index'
end
