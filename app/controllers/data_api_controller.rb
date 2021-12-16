class DataApiController < ApplicationController
  before_action :data_token_filter, only: :call
  before_action -> {set_params_and_token 'data'}, only: :call
  include DataApiRequestHelper

  def show
    @data_api = DataApi.find(params[:id])
  end

  def index
    @data_calls = DataApi.all
  end

  def call
    @resp = make_request(@params, @token)
    render 'calls/resp'
  end

end
