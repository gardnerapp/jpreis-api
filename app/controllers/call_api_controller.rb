class CallApiController < ApplicationController
  include CallApiReqHelper
  before_action :cti_token_filter, only: :call

  def index
    @calls = CallApi.all
  end

  def show
    @call = CallApi.find(params[:id])
  end

  def call
    if params[:api][:xml]
      @method_name = to_method params[:api][:call_name]
      @resp = eval("#{@method_name}(params[:api].to_unsafe_h, cookies['cti_token'])")
    else
      @resp = plain_req(params[:api].to_unsafe_h, cookies['cti_token'])
    end
    render 'calls/resp'
  end

end
