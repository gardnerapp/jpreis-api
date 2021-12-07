class DataApiController < ApplicationController


  def show
    @data_api = DataApi.find(params[:id])
  end

  def index
    # Outline what the Data API is for, link to session paths, list calls 
    @data_calls = DataApi.all
  end

end
