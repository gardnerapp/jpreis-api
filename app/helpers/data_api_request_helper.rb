module DataApiRequestHelper
  require 'faraday'

  def make_request(ip, endpoint, params)
    base_url = "https://#{ip}/#{endpoint}"
    params = params.compact
    params.map {|k,v| base_url.insert(-1, "#{k}#{v}")}
    Faraday.get(base_url)
  end

end
