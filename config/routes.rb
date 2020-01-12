Rails.application.routes.draw do
  # namespace :api do
  #   namespace :v1 do
  #     get 'tokens/create'
  #   end
  # end
  # API definition
  # namespace :api, defaults: { format: :json}, constraints: { subdomain: 'api'}, path: '/' do
  #   scope module: :v1 do
  #   end
  # end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :orders, only: [:index]
      # resources :users, only: [:show, :create]
      resources :users, only: %i[show create update destroy]
      resources :tokens, only: [:create]
      # resources :products, only: %i[show index create update destroy]
      resources :products
    end 
  end
end
