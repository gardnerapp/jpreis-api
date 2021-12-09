class DataApiController < ApplicationController
  before_action :data_token_filter, only: :call

  include DataApiRequestHelper

  def show
    @data_api = DataApi.find(params[:id])
  end

  def index
    # Outline what the Data API is for, link to session paths, list calls 
    @data_calls = DataApi.all
  end

  def call
    @resp = make_request(params[:api].to_unsafe_h, cookies['data_token'])
    render 'calls/resp'
  end

end
