class DeviceApiController < ApplicationController
  include DeviceApiReqHelper
  before_action  -> { set_params_and_token('cti') },  :cti_token_filter, only: :call

  def index
    @devices = DeviceApi.all
  end

  def show
    @device = DeviceApi.find(params[:id])
  end

  def call
    @resp = params[:xml] ? xml_req(@params, @token) : plain_req(@params, @token)
    render 'calls/resp'
  end

end
