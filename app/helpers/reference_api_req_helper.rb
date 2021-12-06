module ReferenceApiReqHelper
  require 'faraday'

  def make_request(params)
    headers = {
      "Content-Type": 'application/xml',
      "X-IPCBWAPIVersion": '2.0/1.2'}
    puts "https://#{params[:api][:ip]}svc/bw/api?/schema=#{params[:api][:schema]}"
    #Faraday.get('https://www.google.com')
    Faraday.get("https://#{params[:ip]}//svc/bw/api?/schema=#{params[:schema]}", headers)
  end
end
