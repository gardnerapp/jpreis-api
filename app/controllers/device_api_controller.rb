class DeviceApiController < ApplicationController
  include DeviceApiHelper
  before_action :cti_token_filter, only: :call

  def index
    @devices = DeviceApi.all
  end

  def show
    @device = DeviceApi.find(params[:id])
  end

  def call

    render 'calls/resp'
  end

end
