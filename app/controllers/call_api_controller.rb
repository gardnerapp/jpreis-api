class CallApiController < ApplicationController
  include CallApiReqHelper
  before_action :cti_token_filter, only: :call
  before_action -> { set_params_and_token 'cti' }, only: :call

  def index
    @calls = CallApi.all
  end

  def show
    @call = CallApi.find(params[:id])
  end

  def call
    if params[:api][:xml]
      @method_name = to_method params[:api][:call_name]
      @resp = send @method_name, @params, @token
    else
      @resp = plain_req(@params, @token)
    end
    render 'calls/resp'
  end

end
