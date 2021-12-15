module RequestHelper

  HEADERS = { "X-IPCBWAPIVersion": '2.0/1.2',
              "Content-Type": 'application/xml'}

  # creates instance variables required for send_req
  def create_req_args(params, body, token)
    @url = "https://#{params[:ip]}#{params[:endpoint]}"
    @body ||= body
    header_token(token) if token
  end

  # adds authorization token to @headers instance variable
  def header_token(token)
    @headers = HEADERS
    @headers['X-IPCAuthToken'] = token
  end

  # Sends a request using send
  # https://rubyapi.org/3.0/o/object#method-i-send
  # Really good exercises https://rubymonk.com/learning/books/5-metaprogramming-ruby-ascent
  #
  # The following instance variables must be initialized within the method before calling send_req
  # If an instance variable does not exist within the module/method scope it automatically will evaluate to nil
  #
  # @method == HTTP verb given in hidden field of form via model attr
  # @base_url == https://IP/ENDPOINT
  # @body == req body
  # @headers == see above
  def send_req
    Faraday.send @method, @url, @body, @headers
    # Ex. @method = "get" Evaluates to
    # Faraday.get(@url, @body, @headers)
  end


  # was prviously on branch call-api-ui


end
