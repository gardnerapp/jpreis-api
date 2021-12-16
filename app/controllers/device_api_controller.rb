class DeviceApiController < ApplicationController
  include DeviceApiReqHelper
  before_action :cti_token_filter, only: :call
  before_action -> { set_params_and_token('token') }, only: :call

  def index
    @devices = DeviceApi.all
  end

  def show
    @device = DeviceApi.find(params[:id])
  end

  def call #TODO add xml param to form
    @resp = params[:xml] ? xml_req(@params, @token) : plain_req(@params, @token)
    render 'calls/resp'
  end

end
