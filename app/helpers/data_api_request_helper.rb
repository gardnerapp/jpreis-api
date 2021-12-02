module DataApiRequestHelper
  require 'faraday'

  def make_request(params, data_api_token)
    base_url = "https://#{params[:ip]}/#{params[:endpoint]}"
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
    response = Faraday.get(base_url, nil, { 'X-IPCAuthToken': data_api_token, "Content-Type": 'application/xml',
                                           "X-IPCBWAPIVersion": '2.0/1.2' })
  end
end
