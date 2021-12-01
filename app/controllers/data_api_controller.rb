class DataApiController < ApplicationController

  def show
    @data_api = DataApi.find(params[:id])
  end

  def req

  end

  def resp
  end

end
