class ApiSessionsController < ApplicationController
  require 'net/http'
  include DataApiSessionsHelper

  def new; end

  # possible tokens:
  #
  # data_token
  # cti_token
  # monitoring_token
  # adminacctmgmt_token
  # enduseracctmgmt_token


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
                    <ns1:ClientType>#{login_params[:session_type]}</ns1:ClientType>
                  </ns1:SessionInfo>
                </ns1:CreateSession>"

    type = login_params[:session_type].downcase

    res = http.request(req, req_body) # make request

    body = Nokogiri::XML(res.body)

    if res.code == 200
      @auth_token = body.at_xpath('//ns1:AuthenticationToken').content
      cookies.encrypted[:username] = { value: login_params[:username], expires: 30.minutes.from_now }
      cookies.encrypted[:password] = { value: login_params[:password], expires: 30.minutes.from_now }
      cookies.encrypted["#{type}_token"] = { value: @auth_token, expires: 25.minutes.from_now }
      flash[:notice] = @auth_token.to_s
    else
      flash[:danger] = "Response Code #{res.code}"
    end
    redirect_to data_api_index_path
  end

  def refresh; end

  # Sends PUT to Refresh Session
  def update
    @token = "#{params[:login][:session_type].downcase}_token"
    @resp = refresh_session(params[:login].to_unsafe_h, cookies[@token], cookies[:username], cookies[:password])
    if @resp.status == 200
      body = @resp.body
      @auth_token = body.at_xpath('//ns1:AuthenticationToken').content
      cookies.encrypted["#{params[:login][:session_type].downcase}_token"] = { value: @auth_token, expires: 95.minutes.from_now }
    end
    render 'calls/resp'
  end

  def terminate
  end

  # terminates session
  def destroy #TODO configure complete clear of sessions
    @token = "#{params[:login][:session_type]}_token"
    @resp = delete_session(params[:login][:ip], cookies[@token], cookies[:username], cookies[:password])
    [@token, 'username', 'password'].each { |c| cookies.delete(c) }
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
    params.require(:login).permit %i[ip username password session_type auth_token]
  end

end
