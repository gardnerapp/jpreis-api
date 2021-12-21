module MonitoringReqHelper
  include RequestHelper

  # {"authenticity_token"=>"[FILTERED]", "api"=>{"ip"=>"", "numrecsperpage"=>"", "pagenum"=>"", "timezone"=>"", "query"=>{"instanceId"=>"", "instanceName"=>"", "zoneId"=>"", "zoneName"=>"", "deviceId"=>"", "deviceUUID"=>"", "deviceRole"=>"", "startTime"=>"", "endTime"=>"", "alertSeverity"=>"", "callID"=>"", "connectionID"=>"", "enterpriseCallID"=>"", "localID"=>"", "localIPAddress"=>"", "origID"=>"", "remoteAddr"=>"", "remoteID"=>""}, "method"=>"get", "endpoint"=>"/svc/bw/monitoring/voip-quality?"}, "commit"=>"Make Request"}
  # setup req get query params in correct spot, loop over other params add &parm=value
  def make_req(params, token)
    endpoint = '/svc/bw/monitoring/voip-quality?'
    # method is get

  end
end
