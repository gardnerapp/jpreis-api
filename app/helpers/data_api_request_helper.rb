module DataApiRequestHelper
  include RequestHelper

  def make_request(params, token)
    create_req_args params, nil, token
    @method = :get
    params.delete(:endpoint)
    params.delete(:ip)
    params.each_pair do |k, v|
      if @base_url.include? k
        @base_url = @base_url.gsub(/{#{k}}/, v)
        params.delete k
      end
    end
    params.delete_if { |_k, v| v.empty? }
    params.each_pair { |k, v| @base_url.insert(-1, "#{k}#{v}") }
    send_req
  end
end
