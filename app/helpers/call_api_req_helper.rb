module CallApiReqHelper
  include RequestHelper

  # takes call name and turns it into method name to be evaled/sent
  def to_method(call_name)
    call_name.downcase.split.join '_'
  end

  # Sets privacy & recording options to false if they are left blank
  def set_privacy_and_recording(params)
    %w[RecordingOption PrivacyOption].each do |option|
      params[option] = false if params[option].empty?
    end
  end

  # makes request that does not have XML body
  def plain_req(params, token)
    create_req_args params, nil, token
    params.each_pair do |k, v|
      @base_url = @base_url.gsub /{#{k}}/, v if @base_url.include? k
    end
    send_req
  end


  def create_an_icm_call_resource(params, token)
    set_privacy_and_recording params
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
            <ns1:Caller ns1:RecordingOption=\"#{params['RecordingOption']}\" ns1:PrivacyOption=\"#{params['PrivacyOption']}\">
              <ns1:UserIdentification>#{params['CallerUserID']}</ns1:UserIdentification>
              <ns1:AudioDevice>
                <ns1:AudioDeviceType>#{params['AudioDeviceType']}</ns1:AudioDeviceType>
                <ns1:HandsetSideType>#{params['HandsetSideType']}</ns1:HandsetSideType>
              </ns1:AudioDevice>
            </ns1:Caller>
           </ns1:CreateCall>"

    create_req_args params, body, token
    send_req
  end

  def create_a_line_call_resource(params, token)

    set_privacy_and_recording params

    body = "<?xml version=\"1 0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<ns1:CreateCall xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:EventCause>MakeCall</ns1:EventCause>
<ns1:ExtendedData>
<ns1:CallInfo>
<ns1:CallType>Resource</ns1:CallType>
<ns1:CallUsageType>#{params['CallUsageType']}</ns1:CallUsageType>
<ns1:CallUsageAttributes>
<ns1:AOR>#{params['AOR']}</ns1:AOR>
<ns1:LineAppearance>#{params['LineAppearance']}</ns1:LineAppearance>
<ns1:DialString>#{params['DialString']}</ns1:DialString>
</ns1:CallUsageAttributes>
</ns1:CallInfo>
</ns1:ExtendedData>
<ns1:Caller ns1:RecordingOption=\"#{params['RecordingOption']}\" ns1:PrivacyOption=\"#{params['PrivacyOption']}\">
<ns1:UserIdentification>#{params['CallerUserID']}</ns1:UserIdentification>
<ns1:AudioDevice>
<ns1:AudioDeviceType>#{params['AudioDeviceType']}</ns1:AudioDeviceType>
<ns1:HandsetSideType>#{params['HandsetSideType']}</ns1:HandsetSideType>
</ns1:AudioDevice>
</ns1:Caller>
</ns1:CreateCall>"
    create_req_args params, body, token
    send_req
  end
end
