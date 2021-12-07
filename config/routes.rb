Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'test/test'
    end
  end

  get '/data_api/login', to: 'data_api_sessions#new'
  post '/data_api/login', to: 'data_api_sessions#create'
  # todo refresh and destroy sessions, ip

  root to: 'data_api#index'

  get '/reference', to: 'reference_api#show'
  post '/reference', to: 'reference_api#create'

  resources :data_api, only: %i[show index]
  resources :cti_api, only: %i[show index]
  post '/cti/call', to: 'cti_api#call'

  post '/call', to: 'calls#req'
  get '/call', to: 'calls#resp'

  # TODO put reference API on Navbar & data api index, add details to data api, data api session
end
