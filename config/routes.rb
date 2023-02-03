Rails.application.routes.draw do
  post 'login', to: 'login#login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :chamas, only: [:show, :create, :update, :destroy]
      resources :users do
        member do
          get :confirm_email
        end
      end
    end
  end

  get "email_verification/:token", to: "application#email_verification", as: :email_verification


end
