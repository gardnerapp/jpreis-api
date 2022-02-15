module RequestHelper
  require 'faraday'

  HEADERS = { "X-IPCBWAPIVersion": '2.0/1.2',
              "Content-Type": 'application/xml'}

  # adds authorization token to @headers instance variable
  def header_token(token)
    @headers = HEADERS
    @headers['X-IPCAuthToken'] = token
  end

  # Adds basic authorization to @headers
  def basic_auth(username, password)
    str = "#{username}:#{password}"
    encoded = Base64.encode64(str)
    @headers['Authorization'] = "Basic: #{encoded}"
  end

  # creates instance variables required for send_req
  def create_req_args(params, body, token)
    @method ||= params[:method]
    @url = "https://#{params[:ip]}#{params[:endpoint]}"
    add_query_params(params)
    @body ||= body
    header_token(token) if token
  end

  # adds query params to @url instance variable
  def add_query_params(params)
    params.each_pair do |k, v|
      if @url.include? k
        @url = @url.gsub /{#{k}}/, v
        params.delete k
      end
    end
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
end
