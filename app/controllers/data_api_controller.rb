class DataApiController < ApplicationController
  include DataApiRequestHelper
  before_action -> { set_params_and_token 'data' }, :data_token_filter, :active_tokens, only: :prepare

  def show
    @data_api = DataApi.find(params[:id])
  end

  def index
    @data_calls = DataApi.all
  end

  # prepares request POST /data/
  def prepare
    prep_request @params, @token
    puts 'in prepare'
    p @body
    render 'request/set'
  end

  def make # see if instance vars from prep hold, render fake response
    @resp = make_request#(@params, @token)
    render 'request/send'
  end

end
