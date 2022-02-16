class DataStatusMonitorApiController < ApplicationController
  include DataStatusMonitorReqHelper
  before_action -> { set_params_and_token 'data' }, :data_token_filter,  only: :call

  def index
    @data_calls = DataStatusMonitorApi.all
  end

  def show
    @data = DataStatusMonitorApi.find(params[:id])
  end

  def call
    @resp = if params[:xml]
              set_method
              send @method_name, @params, @token
            else
              plain_req @params, @token
            end
    render 'calls/resp'
  end

  private

  def set_method
    @method_name = DataStatusMonitorApi.find(params[:api][:id]).to_method
  end


  # Redo this too much

end
