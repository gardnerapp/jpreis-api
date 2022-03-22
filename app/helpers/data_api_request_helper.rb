module DataApiRequestHelper
  include RequestHelper

  def prep_request(params, token)
    create_req_args params, nil, token
    @method = :get
    params.delete(:endpoint)
    params.delete(:ip)
    params.delete_if { |_k, v| v.empty? }
    params['&starttime='] = Time.parse(params['&starttime=']).to_i if params.key?('&starttime=')
    params['&endtime='] = Time.parse(params['&endtime=']).to_i if params.key?('&endtime=')
    params.each_pair do |k, v|
      @url.insert(-1, "#{k}#{v}")
    end
    @url.strip!
  end

end
