module DataApiRequestHelper
  include RequestHelper
  require 'faraday'

  def make_request(params, data_api_token)
    header_token data_api_token
    base_url = "https://#{params[:ip]}#{params[:endpoint]}"
    params.delete(:endpoint)
    params.delete(:ip)
    params.each_pair do |k,v|
      if base_url.include? k
        base_url = base_url.gsub /{#{k}}/, v
        params.delete k
      end
    end
    params.delete_if { |_k,v| v.empty? }
    params.each_pair { |k,v| base_url.insert(-1, "#{k}#{v}") }
    response = Faraday.get(base_url, nil, @headers)
  end
end
