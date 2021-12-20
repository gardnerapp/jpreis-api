class DataStatusMonitorApiController < ApplicationController
  def index
    @data_calls = DataStatusMonitorApi.all
  end

  def show
    @data = DataStatusMonitorApi.find(params[:id])
  end

  def call
    # add form,xml true == to_method_helper add id
    # add req methods to helpers
  end
end
