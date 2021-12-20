module CallApiReqHelper
  include RequestHelper

  # Sets privacy & recording options to false if they are left blank
  def set_privacy_and_recording(params)
    %w[RecordingOption PrivacyOption].each do |option|
      params[option] = false if params[option].empty?
    end
  end

  # makes request that does not have XML body
  def plain_req(params, token)
    create_req_args params, nil, token
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

  def retrieve_a_held_line_call(params, token)
    body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<ns1:CreateCall xmlns:ns1=\"http://www.ipc.com/bw\">
<EventCause>RetrieveCall</EventCause>
<ExtendedData>
<CallInfo>
<CallType>#{params['CallType']}</CallType>
<CallUsageType>#{params['CallUsageType']}</CallUsageType>
<CallUsageAttributes>
<AOR>#{params['AOR']}</AOR>
<LineAppearance>#{params['LineAppearance']}</LineAppearance>
<DialString />
</CallUsageAttributes>
</CallInfo>
</ExtendedData>
<CallCharacteristics>#{params['CallCharacteristics']}</CallCharacteristics>"
    create_req_args params, body, token
    send_req
  end

  # eql to def add_party_line_call
  %i[add remove].each do |method|
    define_method "#{method}_party_line_call" do |params, token| # params and token = method args
      body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<ns1:Party xmlns=\"http://www.ipc.com/bw\">
<ns1:PartyInfo>
<ns1:Action>#{method.capitalize}</ns1:Action>
<ns1:CallUsageAttributes>
<ns1:AOR>#{params['AOR']}</ns1:AOR>
<ns1:LineAppearance>#{params['LineAppearance']}</ns1:LineAppearance>
<ns1:DialString>#{params['DialString']}</ns1:DialString>
</ns1:CallUsageAttributes>
</ns1:PartyInfo>
</ns1:Party>"
      create_req_args params, body, token
      send_req
    end
  end

  def transfer_line_call(params, token)
    body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<TransferCall xmlns=\"http://www.ipc.com/bw\">
<AOR>#{params['AOR']}</AOR>
<LineAppearance>#{params['LineAppearance']}</LineAppearance>
<TransferType>#{params['TransferType']}</TransferType>
</TransferCall>"
    create_req_args params, body, token
    send_req
  end


end
