Rails.application.routes.draw do
  resources :calls, except: %i[new edit update destroy]

  get '/data/save', to: 'data_api#save'

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
  post '/data', to: 'data_api#prepare'
  get '/data/request', to: 'data_api#make'

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

  # todo fgure out api unix time stmp and wrk on cnvrzion
  # It is the
  # number of milliseconds elapsed since January 1, 197
  # Scaffold generates url vars that aren't pluralized causing err, TODO open pull request
  # todo check if acctmngmnt callls need password reauth,

end
