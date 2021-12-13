module CtiApiHelper
  include RequestHelper
  require 'faraday'

  def xml_req(params, auth_token)
    body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<ns1:CreateMonitor xmlns=\"http://www.ipc.com/bw\">
  <ns1:UserIdentification>#{params['UserIdentification']}</ns1:UserIdentification>"
    monitor_types = params['MonitorType'].split
    filter_types = params['FilterType'].split
    monitor_types.each_index  do |index|
      body << "
    <ns1:MonitorInfo>
      <ns1:MonitorType>#{monitor_types[index]}</ns1:MonitorType>
      <ns1:FilterType>#{filter_types[index]}</ns1:FilterType>
    </ns1:MonitorInfo>"
    end
    unless params['MuteStatusEvent'].empty?
      mute_events = params['MuteStatusEvent'].split
      body << "
      <ns1:EventCustomization>
        <ns1:EventsDropList>"
      mute_events.each { |event| body << "<ns1:Event>#{event}</ns1:Event>" }
      body << "
        </ns1:EventsDropList>
    </ns1:EventCustomization> "
    end
    body << '</ns1:CreateMonitor> '

    header_token auth_token

    url = "https://#{params[:ip]}#{params[:endpoint]}"
    url << params['monitorID'] if params['monitorID']
    eval "Faraday.#{params[:method]}(url, body, @headers)"
  end

  def plain_req(params, auth_token)
    url = "https://#{params[:ip]}#{params[:endpoint]}#{params['monitorID']}"


    header_token auth_token

    #eval "Faraday.#{params[:method]}('https://google.com')"
    eval "Faraday.#{params[:method]}(url, nil, @headers)"
  end

end
