module DeviceApiReqHelper
  include RequestHelper
  def plain_req(params, token)
    create_req_args params, nil, token
    send_req
  end

  def xml_req(params, token)
    body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<ns1:UpdateDeviceProperty xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:DevicePropertyInfo>
<ns1:PropertyName>#{params['PropertyName']}</ns1:PropertyName>
<ns1:PropertyValue>#{params['PropertyValue']}</ns1:PropertyValue>
</ns1:DevicePropertyInfo>
</ns1:UpdateDeviceProperty>"
    create_req_args params, body, token
    send_req
  end
end
