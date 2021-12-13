module CallApiReqHelper
  include RequestHelper
  require 'faraday'
  # takes call name and turns it into method name to be evaled/sent
  def to_method(call_name)
    call_name.downcase.split.join '_'
  end

  def plain_req(params, token)
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

  # todo define constant w headers append headers
  def create_an_icm_call_resource(params, token)
    body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
            <ns1:CreateCall xmlns:ns1=\"http://www.ipc.com/bw\">
            <ns1:EventCause>MakeCall</ns1:EventCause>
            <ns1:ExtendedData>
              <ns1:CallInfo>
                <ns1:CallType>ICM</ns1:CallType>
                <ns1:CallUsageType>#{params['CallUsageType']}</ns1:CallUsageType>
              </ns1:CallInfo>
            </ns1:ExtendedData>
            <ns1:CallCharacteristics>#{params['CallCharacteristics']}</ns1:CallCharacteristics>
            <ns1:Callee>
              <ns1:UserIdentification>#{params['CalleeUserId']}</ns1:UserIdentification>
            </ns1:Callee>
            <ns1:Caller ns1:RecordingOption=\"#{params['RecordingOption']}\" ns1:PrivacyOption=\"#{params['RecordingOption']}\">
              <ns1:UserIdentification>#{params['CallerUserID']}</ns1:UserIdentification>
              <ns1:AudioDevice>
                <ns1:AudioDeviceType>#{params['AudioDeviceType']}</ns1:AudioDeviceType>
                <ns1:HandsetSideType>#{params['HandsetSideType']}</ns1:HandsetSideType>
              </ns1:AudioDevice>
            </ns1:Caller>
           </ns1:CreateCall>"

    header_token token
  end
end
