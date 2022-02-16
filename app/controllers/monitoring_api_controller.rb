class MonitoringApiController < ApplicationController
  include MonitoringReqHelper
  before_action -> { set_params_and_token 'monitoring' }, :monitoring_token_filter,  only: :call

  def show
    @monitoring = MonitoringApi.first
  end

  def call
    @resp = make_req @params, @token
    render 'calls/resp'
  end

end
