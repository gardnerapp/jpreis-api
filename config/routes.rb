Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'test/test'
    end
  end

  get 'bluewave/login', to: 'bluewave/login#new'
  post 'bluewave/login', to: 'bluewave/login#create'
  root to: 'bluewave/home#home'

  resources :data_api, only: :show

  post '/call', to: 'calls#req'
  get '/call', to: 'calls#resp'
end
