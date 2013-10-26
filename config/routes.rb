SimpleLogin::Application.routes.draw do
  resource :sessions
  resources :users

  root "users#index"
end
