Rails.application.routes.draw do
  get 'data_status_monitor_api/index'
  get 'data_status_monitor_api/show'
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

  resources :device_api, only: %i[show index]
  post '/device/call', to: 'device_api#call'


  #
  # Device, DataStatusMonitor, Monitoring 21 calls left
  #
  # TODO add dropdown burger to full navbar do large font
  # TODO add device to navbar
  # #TODO add xml param to form
  # TODO go through todos
  # merge device-ui to data-status-monitor-api

end
