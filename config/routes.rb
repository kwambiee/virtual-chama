Rails.application.routes.draw do
  post 'login', to: 'login#login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :chamas
      resources :users, only: [:show, :create, :update, :destroy]
      resources :chama_memberships, only: [ :create, :update, :destroy ]
    end
  end

  get "email_verification/:token", to: "login#email_verification", as: :email_verification





end
