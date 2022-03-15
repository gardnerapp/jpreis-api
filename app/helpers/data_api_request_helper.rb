module DataApiRequestHelper
  include RequestHelper

  def prep_request(params, token)
    create_req_args params, nil, token
    @method = :get
    params.delete(:endpoint)
    params.delete(:ip)
    params.delete_if { |_k, v| v.empty? }
    params.each_pair do |k, v|
      # Convert start and end times to unix range
      params[k] = Time.parse(v).to_i if %w[&endtime &starttime].include?(k)
      @url.insert(-1, "#{k}#{v}")
    end
  end

end
