class DataApiController < ApplicationController
  include DataApiHelper
  def show
    @data_api = DataApi.find(params[:id])
  end

  def req
    @resp = DataApiHelper.make_request('localhost', params[:api][:endpoint], params[:api][:params])
  end

  def resp
  end

end
