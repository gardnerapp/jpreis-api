module ReferenceApiReqHelper
  include RequestHelper
  require 'faraday'

  def make_request(params)
    Faraday.get("https://#{params[:ip]}//svc/bw/api?/schema=#{params[:schema]}", nil,  HEADERS)
  end
end
