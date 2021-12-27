module MonitoringReqHelper
  include RequestHelper

  # TODO could replace passing in method vars and just use class instance variables
  def make_req(params, token)
    @url = "https://#{params[:ip]}/svc/bw/monitoring/voip-quality?"
    params.delete[:ip]

    query = params[:query].compact
    if query != {}
      @url.concat 'querystr='
      query.each { |k, v| @url.concat("#{k}=\"#{v}\"") }
    end
    params.delete[:query]

    query_params = params.compact
    query_params.each { |k, v| @url.concat "&#{k}=#{v}" }

    header_token token
    Faraday.get(@url, nil, @headers)
  end

  # TODO youtube video on monkey patching hash compact method
  class Hash
    # removes keys that contain empty & nil values
    def compact
      reject { |k, v| k if v.empty? || v.nil? }
    end
  end
end
