module RequestHelper
  HEADERS = { "X-IPCBWAPIVersion": '2.0/1.2',
              "Content-Type": 'application/xml'}


  def header_token(token)
    @headers = HEADERS
    @headers['X-IPCAuthToken'] = token
  end
end
