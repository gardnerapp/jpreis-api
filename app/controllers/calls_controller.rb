class CallsController < ApplicationController
  include DataApiRequestHelper

  def req
    @resp = make_request(params[:api].to_unsafe_h, cookies[:data_api_token])
    render :resp
  end

  def resp; end

end
