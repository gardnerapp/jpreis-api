module DataApiRequestHelper
  require 'faraday'

  # TODO set headers with auth_token, and API version
  def make_request(ip, params)
    base_url = "https://#{ip}/#{params[:endpoint]}"
    params.delete(:endpoint)
    params.delete_if {|k,v| v.empty?}
    p params
    params.each_pair {|k,v| base_url.insert(-1, "#{k}#{v}")}
    p base_url
    # Faraday.get(base_url)
  end

end
