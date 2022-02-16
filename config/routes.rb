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
  post '/data', to: 'data_api#prepare'

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
  # Fake data for show response page
  # button to click show response and send/ render request

  # add API Docs
  # Get screen shots place them in form, for display ask about storage of photos

  # todo add timezone drop down on form
  # todo commands to automatically rotate cookies key in Docker file
  # ask matt number of hours for start and end time, in regular or unix time
  #
  # Adding docs -> show table, upload screenshots
  # or just raw table data
  #
  # Questions for team -> what default values on what calls, default IP addresses
  #
  # todo write guid readme
end
