module ReferenceApiReqHelper
  include RequestHelper
  require 'faraday'

  def make_request(params)
    #Faraday.get('https://www.google.com')
    Faraday.get("https://#{params[:ip]}//svc/bw/api?/schema=#{params[:schema]}", HEADERS)
  end
end
