Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :chamas, only: [:show, :create, :update, :destroy]
    end
  end
end
