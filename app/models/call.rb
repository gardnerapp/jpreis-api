class Call < ApplicationRecord

  def headers(v)
    @headers = v
  end

  private

  def finalize_req
    response = Faraday.send req_verb.downcase, req_endpoint, req_body, RequestHelper::HEADERS
    update_attribute :resp_body, response.body.to_s
    update_attribute :resp_status, response.status
    update_attribute req, false
  end
end
