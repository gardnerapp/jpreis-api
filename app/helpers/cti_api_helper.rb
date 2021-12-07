module CtiApiHelper
  def xml_req(params)
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
    p body
  end

  def plain_req(params)
    puts 'Plain Request'
  end

end
