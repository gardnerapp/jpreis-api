module DataApiSessionsHelper
  require 'faraday'

  def refresh_session(params, token)
    body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<ns1:RefreshSession xmlns:ns1=\"http://www.ipc.com/bw \">
  <ns1:SessionInfo>
      <ns1:ClientType>DATA</ns1:ClientType>
  </ns1:SessionInfo>
</ns1:RefreshSession>"
    
    con = Faraday.new("https://#{params[:ip]}")
    con.basic_auth(params[:username],params[:password])
    con.headers = {
      "Content-Type": 'application/xml',
      "X-IPCBWAPIVersion": '2.0/1.2',
      "X-IPCAuthToken": token
    }
    con.body = body
    response = con.put('/svc/bw/session')
  end

  def delete_session(ip, token, username, password)
    con = Faraday.new("https://#{ip}")
    con.basic_auth username, password 
    con.headers = {
      "Content-Type": 'application/xml',
      "X-IPCBWAPIVersion": '2.0/1.2',
      "X-IPCAuthToken": token
    }
    con.delete('/svc/bw/session')
  end


end
