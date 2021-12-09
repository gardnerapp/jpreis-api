Rails.application.routes.draw do

  get '/sessions/new', to: 'api_sessions#new'
  post '/sessions', to: 'api_sessions#create'
  get '/sessions/refresh', to: 'api_sessions#refresh'
  post '/sessions/refresh', to: 'api_sessions#update'
  get '/sessions/terminate', to: 'api_sessions#terminate'
  post '/sessions/terminate', to: 'api_sessions#destroy'

  root to: 'data_api#index'

  get '/reference', to: 'reference_api#show'
  post '/reference', to: 'reference_api#create'

  resources :data_api, only: %i[show index]
  post '/data/call', to: 'data_api#call'
  resources :cti_api, only: %i[show index]
  post '/cti/call', to: 'cti_api#call'

  post '/call', to: 'calls#req'
  get '/call', to: 'calls#resp'

  # TODO make sure the correct token is being used for the data and cti monitoring api
  # list tokens and their corresponding apis in sessions
end
