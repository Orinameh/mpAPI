Rails.application.routes.draw do
  # API definition
  # namespace :api, defaults: { format: :json}, constraints: { subdomain: 'api'}, path: '/' do
  #   scope module: :v1 do
  #   end
  # end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # resources :users, only: [:show, :create]
      resources :users, only: %i[show create update]
    end 
  end
end
