class DataApiController < ApplicationController

  def show
    @data_api = DataApi.find(params[:id])
  end

end
