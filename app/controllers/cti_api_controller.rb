class CtiApiController < ApplicationController
  include CtiApiHelper
  # todo start monitor sessions
  def index
    @cti = CtiMonitorApi.all
  end

  def show
    @cti = CtiMonitorApi.find(params[:id])
  end

  # POST cti/call
  def call
    @resp = if params[:api]['MonitorType']
              xml_req params[:api].to_unsafe_h, cookies['cti_token']
            else
              plain_req params[:api].to_unsafe_h, cookies['cti_token']
            end
    render 'calls/resp'
  end

end
