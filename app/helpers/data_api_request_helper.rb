module DataApiRequestHelper
  include RequestHelper

  def prep_request(params, token)
    create_req_args params, nil, token
    @method = :get
    params.delete(:endpoint)
    params.delete(:ip)
    params.delete_if { |_k, v| v.empty? }
    params.each_pair { |k, v| @url.insert(-1, "#{k}#{v}") }
  end

  def make_request
    send_req
  end
end
