module DataApiRequestHelper
  include RequestHelper

  def prep_request(params, token)
    create_req_args params, nil, token
    p @body
    @method = :get
    params.delete(:endpoint)
    params.delete(:ip)
    params.delete_if { |_k, v| v.empty? }
    params.each_pair { |k, v| @url.insert(-1, "#{k}#{v}") }
  end

  # instance vars not showing in send req, check diff between include & extend
  def make_request
    p "in make req"
    p @body
    send_req
  end
end
