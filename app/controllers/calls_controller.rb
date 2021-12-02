class CallsController < ApplicationController
  include DataApiRequestHelper

  def req
    @resp = make_request(params[:api].to_unsafe_h)
    render :resp
  end

  def resp; end

end
