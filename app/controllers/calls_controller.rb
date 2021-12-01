class CallsController < ApplicationController
  include DataApiRequestHelper

  def req
    make_request('localhost',  params[:api].to_unsafe_h)
  end

  def resp; end

end
