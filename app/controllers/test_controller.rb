class TestController < ApplicationController
  require 'net/http'
  def show
    url = URI.parse 'http://localhost:4000/api/v1/locations'
    resp = Net::HTTP.get url
    @resp = JSON.parse resp
    # make turbolinks button to hide content
  end
end
