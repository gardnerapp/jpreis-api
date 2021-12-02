class DataApiSessionsController < ApplicationController
  require 'net/http'
  include DataApiSessionsHelper

  def new; end

  # creates session
  def create
    uri = URI.parse "https://#{login_params[:ip]}/svc/bw/session"
    http = Net::HTTP.new uri.host, uri.port

    http.use_ssl = true if uri.scheme == 'https' # Use SSL, Should probably be default
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Post.new(uri.request_uri, headers)
    req.basic_auth login_params[:username].to_s, login_params[:password].to_s # Base64 encode username:password

    req_body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
                <ns1:CreateSession xmlns:ns1=\"http://www.ipc.com/bw\">
                  <ns1:SessionInfo>
                    <ns1:ClientType>DATA</ns1:ClientType>
                  </ns1:SessionInfo>
                </ns1:CreateSession>"

    res = http.request(req, req_body) # make request

    body = Nokogiri::XML(res.body)

    if res.code == 200
      @auth_token = body.at_xpath('//ns1:AuthenticationToken').content
      cookies.encrypted[:username] = {value: login_params[:username], expires: 95.minutes.from_now}
      cookies.encrypted[:password] = {value: login_params[:password], expires: 95.minutes.from_now}
      cookies.encrypted[:data_api_token] = {value: @auth_token, expires: 95.minutes.from_now}
      flash[:notice] = @auth_token.to_s
    else
      flash[:danger] = "Response Code #{res.code}"
    end
    redirect_to data_api_index_path
  end

  # Sends PUT to Refresh Session
# TODO fix to get values from cookies 
  def update
    @resp = refresh_session(params[:login].to_unsafe_h, cookies[:data_api_token])
    if @resp.status == 200
      body = @resp.body
      @auth_token = body.at_xpath('//ns1:AuthenticationToken').content
      cookies.encrypted[:data_api_token] = {value: @auth_token, expires: 95.minutes.from_now}
    else
      render 'calls/resp'
    end
  end

  # terminates session
  def destroy #TODO add IP as cookie as well
    @resp = delete_session('IP', cookies[:data_api_token], cookies[:username], cookies[:password])
    %i[data_api_token username password].each { |c| cookies.delete(c)}
    render 'calls/resp'
  end

  private

  def headers
    {
      "Content-Type": 'application/xml',
      "X-IPCBWAPIVersion": '2.0/1.2'
    }
  end

  def login_params
    params.require(:login).permit %i[ip username password auth_token]
  end

end
