module CallApiReqHelper
  
  def get_req(params, token)
    base_url = "#{params[:ip]}#{params[:endpoint]}"
    params.delete :ip
    params.delete :endpoint
    params.each_pair do |k, v|
      if base_url.include? k
        base_url = base_url.gsub /{#{k}}/, v
        params.delete k
      end
    end
    eval  "Faraday.#{params[:method]}(base_url, nil, { 'X-IPCAuthToken': token, 'Content-Type': 'application/xml',
                                            'X-IPCBWAPIVersion': '2.0/1.2' })"
  end
end
