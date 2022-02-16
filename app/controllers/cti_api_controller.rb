class CtiApiController < ApplicationController
  include CtiApiHelper
  before_action  -> { set_params_and_token 'cti' }, :cti_token_filter, only: :call

  def index
    @cti = CtiMonitorApi.all
  end

  def show
    @cti = CtiMonitorApi.find(params[:id])
  end

  # POST cti/call
  def call
    @resp = params[:api['xml']] ? xml_req(@params, @token) : plain_req(@params, @token)
    render 'calls/resp'
  end

end
