class MonitoringApiController < ApplicationController
  include MonitoringReqHelper
  before_action :monitoring_token_filter, -> { set_params_and_token 'monitoring' }, only: :call

  def show
    @monitoring = MonitoringApi.first
  end

  def call
    @resp = make_req @params, @token
    render 'calls/resp'
  end

end
