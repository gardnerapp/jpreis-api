Rails.application.routes.draw do
  get 'call_api/index'
  get 'call_api/show'

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

  resources :call_api, only: %i[show index]
  post '/call/call', to: 'call_api#call'

  # Todo figure out xml k/v pairs for call api
  # how to render these into forms,
  # once form is submitted differentite between xml and plain req
  #
  #
  # xml params write out as hash
end
