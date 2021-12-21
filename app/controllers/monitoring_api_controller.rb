class MonitoringApiController < ApplicationController
  before_action :monitoring_token_filter, -> { set_params_and_token 'monitoring' }, only: :call

  def show
    @monitoring = MonitoringApi.first
  end

  #TORO make sure query str is fed query str params in proproper format
  # prefix query params with &

  def call
    p params
  end

end
