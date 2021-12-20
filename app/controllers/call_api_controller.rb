class CallApiController < ApplicationController
  include CallApiReqHelper
  before_action :cti_token_filter, :set_method, -> {set_params_and_token 'cti' }, only: :call

  def index
    @calls = CallApi.all
  end

  def show
    @call = CallApi.find(params[:id])
  end

  def call
    @resp = if params[:api][:xml]
              send @method_name, @params, @token
            else
              plain_req(@params, @token)
            end
    render 'calls/resp'
  end

  private

  def set_method
    @call = CallApi.find(params[:api][:call_id])
    @method_name = to_method @call.name
  end

end
