class CallApiController < ApplicationController
  include CallApiReqHelper
  before_action -> {set_params_and_token 'cti' }, :cti_token_filter, only: :call

  def index
    @calls = CallApi.all
  end

  def show
    @call = CallApi.find(params[:id])
  end

  def call
    @resp = if params[:api][:xml]
              set_method
              send @method_name, @params, @token
            else
              plain_req(@params, @token)
            end
    render 'calls/resp'
  end

  private

  def set_method
    @method_name = CallApi.find(params[:api][:call_id])/to_method
  end

end
