# frozen_string_literal: true
class DataApiController < ApplicationController
  include DataApiRequestHelper
  before_action -> { set_params_and_token 'data' }, :data_token_filter, :active_tokens, only: :prepare

  def show
    @data_api = DataApi.find(params[:id])
  end

  def index
    @data_calls = DataApi.all
  end
  
  # preps instance vars & shows cli data they are sending
  # POST /data/
  def prepare
    prep_request @params, @token
    @call = Call.create(req_endpoint: @url, req_verb: @method.upcase, req_body: @body)
    @call.headers(@headers)
    render 'calls/new'
  end

end
