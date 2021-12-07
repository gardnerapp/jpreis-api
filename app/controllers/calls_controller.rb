class CallsController < ApplicationController
  include DataApiRequestHelper

  def req
    @resp = make_request(params[:api].to_unsafe_h, cookies['data_token'])
    render :resp
  end

  def resp; end

  def download
    @file = File.open("API-#{Time.now.strftime('%d/%m/%Y %H:%M')}", 'w') { |f| f.write(@resp) }
  end

end
