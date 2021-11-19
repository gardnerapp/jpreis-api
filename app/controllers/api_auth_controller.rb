class ApiAuthController < ApplicationController
  require 'net/http'
  require 'openssl'

  # GET /auth Blue Wave Sign In Form
  def new; end

  # POST /auth Sends Post Request to Blue Wave API
  def create
    uri = URI.parse "http://bluewave.com/#{auth_params[:bluewave_ip]}" #TODO get actual domain
    http = Net::HTTP uri.host, uri.port

    http.use_ssl = true if uri.scheme == 'https' # Use SSL, Should probably be default
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Post.new(uri.request_uri, xml_headers)
    req.basic_auth auth_params[:username], auth_params[:password] # Base64 encode username:password
    res = http.request(req) # make request
    p "[*] Status Code: #{res.code}"
    p "[*] Headers: #{res.to_h}"
    p "[*] Body: #{res.body }"
    @auth_token = res["Auth Token"] #TODO get actual auth_token
    cookies.encrypted[:bluewave_token] = {:value => @auth_token, expires: 24.hours.from_now}
    #
    # Cookie retrieval -> decryption is automatic and implicit example:
    #  variable = cookies[:bluewave_token]
    #
    # TODO add set_cookie helper, encrypt, 24 hr expire by defualt
    # TODO get responses for wrong username, password and IP, flash these on :new when they occur
    # TODO redirect to blue wave API interface
  end

  private

  def auth_params
    params.require(:user).permit %i[bluewave_ip username password]
  end

  def xml_headers
    {'Content-Type': 'application/xml'}
  end
end
