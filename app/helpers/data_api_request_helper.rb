module DataApiRequestHelper
  include RequestHelper

  def make_request(params, token)
    create_req_args params, nil, token
    @method = :get
    params.delete(:endpoint)
    params.delete(:ip)
    add_query_params(params)
    params.delete_if { |_k, v| v.empty? }
    params.each_pair { |k, v| @url.insert(-1, "#{k}#{v}") }
    send_req
  end
end
