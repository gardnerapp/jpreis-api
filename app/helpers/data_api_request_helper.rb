module DataApiRequestHelper
  require 'faraday'


  def make_request(ip, params)
    base_url = "https://#{ip}/#{params[:endpoint]}"
    params.delete(:endpoint)
    params.delete_if {|k,v| v.empty?}
    params.each_pair {|k,v| base_url.insert(-1, "#{k}#{v}")}
    # Faraday.get(base_url)
    resp = Faraday.get('https://www.google.com')
  end

end
