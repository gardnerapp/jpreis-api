Rails.application.routes.draw do
  root to: 'data_api#index'

  # Authorization Endpoints
  get '/sessions/new', to: 'api_sessions#new'
  post '/sessions', to: 'api_sessions#create'
  get '/sessions/refresh', to: 'api_sessions#refresh'
  post '/sessions/refresh', to: 'api_sessions#update'
  get '/sessions/terminate', to: 'api_sessions#terminate'
  post '/sessions/terminate', to: 'api_sessions#destroy'

  # Calling pages
  get '/reference', to: 'reference_api#show'
  post '/reference', to: 'reference_api#create'

  resources :data_api, only: %i[show index]
  post '/data/call', to: 'data_api#call'

  resources :cti_api, only: %i[show index]
  post '/cti/call', to: 'cti_api#call'

  resources :call_api, only: %i[show index]
  post '/call/call', to: 'call_api#call'

  resources :device_api, only: %i[show index]
  post '/device/call', to: 'device_api#call'

  resources :data_status_monitor_api, only: %i[show index]
  post '/data_status_monitor', to: 'data_status_monitor_api#call'

  resources :monitoring_api, only: :show
  post '/monitoring/call', to: 'monitoring_api#call'

  resources :management_api, only: %i[show index]
  post '/management/call', to: 'management_api#call'

  # todo write test 4 filters

  # todo add timezone drop down on form
  # ask matt number of hours for start and end time, in regular or unix time
end
