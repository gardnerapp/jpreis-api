module DataStatusMonitorReqHelper
  include RequestHelper

  def plain_req(params, token)
    create_req_args params, nil, token
    send_req
  end

  def create_data_status_monitor_resource(params, token) # TODO change these calls for dynamic resource list
    body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<ns1:CreateDataStatusMonitor xmlns:ns1=\"http://www.ipc.com/bw\"
xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">
<ns1:FilterList>
<ns1:Filter xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"
xsi:type=\"ns1:LineResourceFilter\">
<ns1:LineResourceList>
<ns1:LineResource>
<ns1:AOR>#{params['MonitorMode']}</ns1:AOR>
<ns1:Appearance>#{params['MonitorMode']}</ns1:Appearance>
</ns1:LineResource>
</ns1:LineResourceList>
</ns1:Filter>
</ns1:FilterList>
<ns1:MonitorInfo>
<ns1:MonitorMode>#{params['MonitorMode']}</ns1:MonitorMode>
</ns1:MonitorInfo>
</ns1:CreateDataStatusMonitor>"
    create_req_args params, body, token
    send_req
  end

  def update_data_status_monitor_resource(params,token)
    body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<ns1:UpdateDataStatusMonitor xmlns:ns1=\"http://www.ipc.com/bw\"
xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">
<ns1:Filter xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"
xsi:type=\"ns1:LineResourceFilter\">
<ns1:LineResourceList>
<ns1:LineResource>
<ns1:AOR>#{params['AOR']}</ns1:AOR>
<ns1:Appearance>#{params['Appearance']}</ns1:Appearance>
</ns1:LineResource>
</ns1:LineResourceList>
</ns1:Filter>
<ns1:ActionType>#{params['ActionType']}</ns1:ActionType>
</ns1:UpdateDataStatusMonitor>"
    create_req_args params, body, token
    send_req
  end

end
