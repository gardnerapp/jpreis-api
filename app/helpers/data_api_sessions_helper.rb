module DataApiSessionsHelper
  include RequestHelper

  def refresh_session(params, token, username)
    header_token token
    body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<ns1:RefreshSession xmlns:ns1=\"http://www.ipc.com/bw \">
  <ns1:SessionInfo>
      <ns1:ClientType>#{params[:session_type]}</ns1:ClientType>
  </ns1:SessionInfo>
</ns1:RefreshSession>"

    con = Faraday.new("https://#{params[:ip]}")
    con.basic_auth(username, params[:password])
    con.headers = @headers
    con.body = body
    response = con.put('/svc/bw/session')
  end

  def delete_session(ip, token, username)
    header_token token
    con = Faraday.new("https://#{ip}")
    con.basic_auth username, params[:password]
    con.headers = @headers
    con.delete('/svc/bw/session')
  end


end
