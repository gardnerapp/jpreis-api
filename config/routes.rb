Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'test/test'
    end
  end

  get '/data_api/login', to: 'data_api_sessions#new'
  post '/data_api/login', to: 'data_api_sessions#create'

  root to: 'bluewave/home#home'

  resources :data_api, only: %i[show index]

  post '/call', to: 'calls#req'
  get '/call', to: 'calls#resp'
end
