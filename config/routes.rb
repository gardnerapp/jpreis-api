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
  get '/data_api/response', to: 'data_api#resp'
  post '/data_api', to: 'data_api#req'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
end
