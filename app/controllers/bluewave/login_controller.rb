class Bluewave::LoginController < ApplicationController
  require 'net/http'

  def new
  end

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

=begin
    p "[*] Status Code: #{res.code}"
    p "[*] Headers: #{res.to_hash}"
    p "[*] Body: #{res.body }"
=end

    body = Hash.from_xml(res.body)
    if res.code == 200
      @auth_token = body.dig('ns1:AuthorizationInfo', 'ns1:AuthenticationToken')
      cookies.encrypted[:bluewave_token] = {value: @auth_token, expires: 95.minutes.from_now}
      flash[:notice] = @auth_token.to_s
    else
      flash[:danger] = "Response Code #{res.code}"
    end
    redirect_to bluewave_login_path
  end

  # refreshes session resource
  def update
    # cti managment data all of them ?
  end

  # terminates session
  def destroy
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
