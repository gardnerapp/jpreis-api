Call.create(
  name: 'Communication History',
  category: 'Data',
  req_endpoint: '192.168.0.1//svc/bw/data/communication-history?filtertype=foo&loginname=example_username&timezone=EST&timeformat=absolute&eventtype=bar',
  req_body: nil,
  req_verb: 'GET',
  resp_status: 202,
  req: true,
  resp_body: "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?
><ns1:CommunicationHistoryResponse xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:NumPagesAvailable>131</ns1:NumPagesAvailable>
<ns1:Reason>
<ns1:ReasonCode>REQ_SUCCESS</ns1:ReasonCode>
<ns1:ReasonDescription>Fetch Communication History Successful</
ns1:ReasonDescription>
</ns1:Reason>
<ns1:CommunicationHistoryList>
<ns1:CommunicationHistory>
<ns1:lastModified>2013-11-12T11:22:44-05:00</ns1:lastModified>
<ns1:id>33554471</ns1:id>
<ns1:cLIName>Perf15001frst Perf15001last</ns1:cLIName>
<ns1:cLINumber>15001</ns1:cLINumber>
<ns1:buttonNumber>-1</ns1:buttonNumber>
<ns1:callType>icmgroup</ns1:callType>
<ns1:callUsage>gtbk</ns1:callUsage>
<ns1:destination>15002</ns1:destination>
<ns1:deviceChannel>left</ns1:deviceChannel>
<ns1:deviceChannelType>Handset</ns1:deviceChannelType>
<ns1:deviceIdId>33554435</ns1:deviceIdId>
<ns1:displayInCallHistory>true</ns1:displayInCallHistory>
<ns1:duration>16</ns1:duration>
<ns1:e164Destination xsi:nil=\"true\" xmlns:xsi=\"http://www.w3.org/
  2001/XMLSchema-instance\"/>
<ns1:eventType>Received</ns1:eventType>
<ns1:parentUserCDIId>33554559</ns1:parentUserCDIId>
<ns1:personalPointOfContactId>0</ns1:personalPointOfContactId>
<ns1:pointOfContactId>0</ns1:pointOfContactId><ns1:priority>none</ns1:priority>
<ns1:reasonForDisconnect>User Released</ns1:reasonForDisconnect>
<ns1:resourceAORId>0</ns1:resourceAORId>
<ns1:rolloverAppearance>0</ns1:rolloverAppearance>
<ns1:routedDestination>15002@10.205.202.87:5060</
ns1:routedDestination>
<ns1:startTime>2013-11-12T11:22:28-05:00</ns1:startTime>
<ns1:trunkBChannel>-1</ns1:trunkBChannel>
<ns1:trunkId>0</ns1:trunkId>
<ns1:userId>33554437</ns1:userId>
<ns1:pttDuration>0</ns1:pttDuration>
<ns1:ringTime>1</ns1:ringTime>
<ns1:enterpriseCallId>Call_19_10.205.238.86_1384273347495</
ns1:enterpriseCallId>
<ns1:connectionId>Conn_46_10.205.238.86_1384273347496</
ns1:connectionId>
</ns1:CommunicationHistory>
<ns1:CommunicationHistory>
<ns1:lastModified>2013-11-12T11:23:05-05:00</ns1:lastModified>
<ns1:id>33554474</ns1:id>
<ns1:cLIName>Perf15001frst Perf15001last</ns1:cLIName>
<ns1:cLINumber>15001</ns1:cLINumber>
<ns1:buttonNumber>-1</ns1:buttonNumber>
<ns1:callType>icmgroup</ns1:callType>
<ns1:callUsage>gtbk</ns1:callUsage>
<ns1:destination>15002</ns1:destination>
<ns1:deviceChannel>left</ns1:deviceChannel>
<ns1:deviceChannelType>Handset</ns1:deviceChannelType>
<ns1:deviceIdId>33554435</ns1:deviceIdId>
<ns1:displayInCallHistory>true</ns1:displayInCallHistory>
<ns1:duration>15</ns1:duration>
<ns1:e164Destination xsi:nil=\"true\" xmlns:xsi=\"http://www.w3.org/
  2001/XMLSchema-instance\"/>
<ns1:eventType>Received</ns1:eventType>
<ns1:parentUserCDIId>33554559</ns1:parentUserCDIId>
<ns1:personalPointOfContactId>0</ns1:personalPointOfContactId>
<ns1:pointOfContactId>0</ns1:pointOfContactId>
<ns1:priority>none</ns1:priority>
<ns1:reasonForDisconnect>User Released</ns1:reasonForDisconnect>
<ns1:resourceAORId>0</ns1:resourceAORId>
<ns1:rolloverAppearance>0</ns1:rolloverAppearance>
<ns1:routedDestination>15002@10.205.202.87:5060</
ns1:routedDestination>
<ns1:startTime>2013-11-12T11:22:49-05:00</ns1:startTime>
<ns1:trunkBChannel>-1</ns1:trunkBChannel>
<ns1:trunkId>0</ns1:trunkId>
<ns1:userId>33554437</ns1:userId>
<ns1:pttDuration>0</ns1:pttDuration>
<ns1:ringTime>1</ns1:ringTime>
<ns1:enterpriseCallId>Call_20_10.205.238.86_1384273368730</
ns1:enterpriseCallId>
<ns1:connectionId>Conn_49_10.205.238.86_1384273368730</
ns1:connectionId>
</ns1:CommunicationHistory>
</ns1:CommunicationHistoryList>
</ns1:CommunicationHistoryResponse>"
  
)

ManagementApi.create([
                       # ADMIN ACCT MNGMNT CALLS
                       {
                         name: 'Fetch hash of administrative account password',
                         endpoint: '/svc/bw/acctmgmt/admin/password?querystr=',
                         method: 'get',
                         xmlparameters: nil,
                         queryparameters: 'loginName',
                         admin: true
                       },
                       {
                         name: 'Change administrative account password',
                         endpoint: '/svc/bw/acctmgmt/admin/password',
                         method: 'put',
                         xmlparameters: 'LoginName NewPassword CurrentPassword',
                         queryparameters: nil,
                         admin: true
                       },

                       # END USER ACTT MNGMNT CALLS
                       {
                         name: 'Create an end user account',
                         endpoint: '/svc/bw/acctmgmt/user',
                         method: 'post',
                         xmlparameters: 'LoginName Password PasswordChangeMode
                          IsTemporary AuthType FirstName LastName Locale Email LocationId AccountPolicyId',
                         queryparameters: nil
                       },
                       {
                         name: 'Assign or remove role',
                         endpoint: '/svc/bw/acctmgmt/user/role-list?operation=',
                         method: 'put',
                         xmlparameters: 'LoginName RoleNames',
                         queryparameters: 'operation'
                       },
                       {
                         name: 'Add or remove user from group',
                         endpoint: '/svc/bw/acctmgmt/user/group-membership?operation=',
                         method: 'put',
                         xmlparameters: 'UserId GroupId',
                         queryparameters: 'operation'
                       },
                       {
                         name: 'Assign or revoke license',
                         endpoint: '/svc/bw/acctmgmt/user/license?operation=',
                         method: 'put',
                         xmlparameters: 'UserId LicenseFeatureCode',
                         queryparameters: 'operation'
                       },
                       {
                         name: 'Add point of contact for user',
                         endpoint: '/svc/bw/acctmgmt/user/point-of-contact?operation=',
                         method: 'put',
                         xmlparameters: 'UserId ButtonLabel MediaType POCType Data PreferredPOC',
                         queryparameters: 'operation'
                       },
                       {
                         name: 'Change user account password',
                         endpoint: '/svc/bw/acctmgmt/user/password',
                         method: 'put',
                         xmlparameters: 'LoginName NewPassword PasswordChangeMode',
                         queryparameters: nil
                       },
                       {
                         name: 'Update user attributes',
                         endpoint: '/svc/bw/acctmgmt/user',
                         method: 'put',
                         xmlparameters: 'UserId FirstName LastName',
                         queryparameters: nil
                       },
                       {
                         name: 'Update user trader features',
                         endpoint: '/svc/bw/acctmgmt/user/trader-features',
                         method: 'put',
                         xmlparameters: 'LoginName PersonalExtension IntercomExtension HuntGroupId UnigyLocationId
                          BillingGroupId AutoSelectHold Language AllowPrivacyToggle AlternateHandsetSelectTimeout
BlockingToneOnSpeakerMute CLIDisplayPreference CodecProfileId CreateSimplexPresetBroadcast Custom1 Custom2 Custom3 Custom4
DeskLocation DivertICMCallsTo DurForICMRNADiversion FixedButtonRows FloatAllIncomingCalls FloatCallsOnHold FloatingButtonRows
FloatPriorityProfileId ForceTalkbackMute HandsetButtonActions HandsetCallMuteOption HandsetSelectMode HomeZoneId ICMDiversionCondition
ICMDiversionMode ICMRecording ICMSplashTone ImplicitHunt InfiniteRing InterDigitTimeout IntrusionTone LatchGroupTalkback1
LatchGroupTalkback2 MaintainICMDivertUponLogOn MaxDigitForTheDivertToNumber MusicOnHoldId RecordOnDemand RecordWarningTone SpeakerMicMuteOption
SpeakerRetryTime UserPrivacyDefaultsToEnabled',
                         queryparameters: nil
                       },
                       {
                         name: 'Force log out',
                         endpoint: '/svc/bw/acctmgmt/user/cdi-session?operation=force-logout',
                         method: 'put',
                         xmlparameters: 'UserId IgnoreOpenHandSetCalls',
                         queryparameters: nil
                       },
                       {
                         name: 'Update user button settings',
                         endpoint: '/svc/bw/acctmgmt/user/button',
                         method: 'put',
                         xmlparameters: 'UserId ButtonId ButtonType ButtonLabel LockedForProgrammingAtCDI
                          IncomingActionRings IncomingActionPriority IncomingActionFloat DisplayIncomingCLI RingTone
                          DisplayInCallHistory ResourceAORId LineAppearance SpeedDialType AutoSignal',
                         queryparameters: nil
                       },
                     ])


MonitoringApi.create(
  name: 'Fetch VoIP quality information',
  guidelines: 'Fetch VoIP quality call detail records (VQ-CDR) for a device from the Unigy database. The response
returns this information in a paginated format.',
  queryparameters: {
    'numrecsperpage': 'The number of records to be returned per page. If absent, the maximum number of records is returned. Valid values are: 1 to 300',
    'pagenum': 'The specific page number of the paginated data to
be returned. If absent, the first page is returned.
Valid values are:
1 to n',
    'timezone': "
    Time zone of the time values in the returned data, this value is required.
Valid values are:
EST, IST, MIT, HST, AST, PST, MST, PNT, CST,
IET, PRT, AGT, BET, GMT, UCT, CET, ART, CAT,
EAT, NET, PLT, BST, VST, CTT, JST, ACT, AET,
NST, HAST, AKST, PDT, CDT, CNT, WET, WEST,
CEST, EET, MET, ICT, AWST, ACST, AEST, SST,
NZST, EDT", },
  querystrparameters: { # Key == query str name, value == query str description
    'instanceId': 'Unique identifier for the instance. When specified, fetches all VoIP quality records for all zones in
the instance. The instance, zone, and device identifiers in this table do not
apply to SBCs, and if specified, will return no records for SBCs.',
    'instanceName': 'Unique name that identifies the instance.',
    'zoneId': 'Uniquely identifies the zone in Unigy. When specified, fetches all
VoIP quality records for this zone.',
    'zoneName': 'Unique name that identifies the zone in Unigy.',
    'deviceId': 'Uniquely identifies the device in Unigy. When specified, fetches
all VoIP quality records generated by this device.',
    'deviceUUID': 'Uniquely identifies the device in the network. When specified,
fetches all VoIP quality records generated by this device.',
    'deviceRole': 'When specified, fetches all VoIP quality records for all devices
that match the device role. Valid values are:
Media_Gateway
Turret
UDA
Pulse
Server
You cannot search for VoIP quality records created by SBCs by
device role.',
    'startTime': 'Start time for filtering records in the database. Represented in
milliseconds since January 1, 1970, 00:00:00 GMT. When
specified, fetches all records in the database whose start time is
greater than or equal to this value.',
    'endTime': 'End time for filtering records in the database. Represented in
milliseconds since January 1, 1970, 00:00:00 GMT. When
specified, fetches all records in the database whose end time is
less than or equal to this value.',
    'alertSeverity': 'Alert severity. Valid values are: Warning, Critical, Clear',
    'callID': 'Call identifier of the call for this line',
    'connectionID': 'Identifier for the connection associated with the call detail record
(CDR)',
    'enterpriseCallID': 'Identifier for all CDRs associated with a particular call.',
    'localID': 'Identifier of the reporting endpoint',
    'localIPAddress': 'IP address of the device receiving RTP reported on.',
    'origID': 'Identifies the endpoint which originated the record.',
    'remoteAddr': 'IP address of the remote endpoint.',
    'remoteID': 'Identifier of the remote endpoint'
  }
)
DataStatusMonitorApi.create( [
                              {
                                name: 'Create data status monitor resource',
                                endpoint: '/svc/bw/data/status-monitor',
                                method: 'post',
                                queryparameters: nil,
                                xmlparameters: 'AOR Appearance MonitorMode'
                              },
                              {
                                name: 'Update data status monitor resource',
                                endpoint: '/svc/bw/data/status-monitor/{monitorid}',
                                method: 'put',
                                queryparameters: 'monitorid',
                                xmlparameters: 'AOR Appearance ActionType'
                              },
                              {
                                name: 'Fetch details of a data status monitor resource',
                                endpoint: '/svc/bw/data/status-monitor/{monitorid}',
                                method: 'get',
                                queryparameters: 'monitorid',
                                xmlparameters: nil
                              },
                              {
                                name: 'Fetch resource updates by polling the data status monitor',
                                endpoint: '/svc/bw/data/status-monitor/event/{monitorid}',
                                method: 'get',
                                queryparameters: 'monitorid',
                                xmlparameters: nil
                              },
                              {
                                name: 'Delete a data status monitor resource',
                                endpoint: '/svc/bw/data/status-monitor/{monitorid}',
                                method: 'get',
                                queryparameters: 'monitorid',
                                xmlparameters: nil
                              },
                             ])

# Device API Calls
DeviceApi.create([
                   {
                     name: 'Fetch the resource ID for a device resource',
                     endpoint: '/svc/bw/cti/device?username={loginname}/',
                     method: 'get',
                     queryparameters: 'loginname',
                     xmlparameters: nil,
                   },
                   {
                     name: 'Fetch the status of a device resource',
                     endpoint: 'svc/bw/cti/device/{resourceID}/status?type={StatusTypes}',
                     method: 'get',
                     queryparameters: 'resourceID StatusTypes',
                     xmlparameters: nil,
                   },
                   {
                     name: 'Update the property of a device resource',
                     endpoint: '/svc/bw/cti/device/{resourceID}',
                     method: 'put',
                     queryparameters: 'resourceID',
                     xmlparameters: 'PropertyName PropertyValue',
                   }
                 ])

# Call API calls
CallApi.create([{
                 name: 'Create an ICM call resource',
                 endpoint: '/svc/bw/cti/call',
                 method: 'post',
                 queryparameters: nil,
                 xmlparameters: 'CallUsageType CallCharacteristics CalleeUserId CallerUserID RecordingOption
                  PrivacyOption AudioDeviceType HandsetSideType',
               },
                {
                  name: 'Create a line call resource',
                  endpoint: '/svc/bw/cti/call',
                  method: 'post',
                  queryparameters: nil,
                  xmlparameters: 'CallUsageType AOR LineAppearance DialString  CallerUserID RecordingOption
                  PrivacyOption AudioDeviceType HandsetSideType',
                },
                {
                  name: 'Fetch a call resource',
                  endpoint: '/svc/bw/cti/call/{resourceID}',
                  method: 'get',
                  queryparameters: 'resourceID',
                  xmlparameters: nil,
                },
                {
                  name: 'Delete a call resource',
                  endpoint: '/svc/bw/cti/call/{resourceID}',
                  method: 'delete',
                  queryparameters: 'resourceID',
                  xmlparameters: nil,
                },
                {
                  name: 'Signal a private line call',
                  endpoint: '/svc/bw/cti/call/{resourceID}/signaling',
                  method: 'put',
                  queryparameters: 'resourceID',
                  xmlparameters: nil,
                },
                {
                  name: 'Hold a line call',
                  endpoint: '/svc/bw/cti/call/{resourceID}/hold',
                  method: 'put',
                  queryparameters: 'resourceID',
                  xmlparameters: nil,
                },
                {
                  name: 'Dial digits',
                  endpoint: '/svc/bw/cti/call/{resourceID}?digits={dial-digits}',
                  method: 'put',
                  queryparameters: 'resourceID dial-digits',
                  xmlparameters: nil,
                },
                {
                  name: 'Retrieve a held line call',
                  endpoint: '/svc/bw/cti/call/',
                  method: 'post',
                  queryparameters: nil,
                  xmlparameters: 'CallType CallUsageType AOR LineAppearance CallCharacteristics'
                },
                {
                  name: 'Add party line call',
                  endpoint: '/svc/bw/cti/call/{resourceID}/conference',
                  method: 'put',
                  queryparameters: 'resourceID',
                  xmlparameters: 'AOR LineAppearance DialString'
                },
                {
                  name: 'Remove party line call',
                  endpoint: '/svc/bw/cti/call/{resourceID}/conference',
                  method: 'put',
                  queryparameters: 'resourceID',
                  xmlparameters: 'AOR LineAppearance DialString'
                },
                {
                  name: 'Transfer line call',
                  endpoint: '/svc/bw/cti/call/{resourceID}/transferral',
                  method: 'put',
                  queryparameters: 'resourceID',
                  xmlparameters: 'AOR LineAppearance TransferTyp'
                },
                {
                  name: 'Complete a line call transfer',
                  endpoint: '/svc/bw/cti/call/{resourceID}/transferralcompletion',
                  method: 'put',
                  queryparameters: 'resourceID',
                  xmlparameters: nil,
                }
               ])

# Create CTI Monitor API Calls
CtiMonitorApi.create([{
                       name: 'Create a CTI monitor resource',
                       endpoint: '/svc/bw/cti/monitor',
                       method: 'post',
                       # Instructions to set monitor types & filter type seperated by a comma, mute status events seperated by  a common,
                       xmlparameters: 'UserIdentification MonitorType FilterType MuteStatusEvent',
                       queryparameters: nil
                     },
                      {
                        name: 'Fetch a CTI monitor resource',
                        endpoint: '/svc/bw/cti/monitor/',
                        method: 'get',
                        xmlparameters: nil,
                        queryparameters: 'monitorID'
                      },
                      {
                        name: 'Fetch an event on the CTI monitor resource',
                        endpoint: '/svc/bw/cti/monitor/event/',
                        method: 'get',
                        xmlparameters: nil,
                        queryparameters: 'monitorID'
                      },
                      {
                        name: 'Update a CTI monitor resource',
                        endpoint: '/svc/bw/cti/monitor/',
                        method: 'put',
                        xmlparameters: 'UserIdentification MonitorType FilterType MuteStatusEvent',
                        queryparameters: 'monitorID'
                      },
                      {
                        name: 'Delete a CTI monitor resource',
                        endpoint: '/svc/bw/cti/monitor/',
                        method: 'delete',
                        xmlparameters: nil,
                        queryparameters: 'monitorID'
                      }])

# Create Data API Calls
DataApi.create([{
                 name: 'Communication History',
                 endpoint: '/svc/bw/data/communication-history?',
                 queryparameters: "filtertype={filtertype} &loginname={loginname}
&starttime={starttime} &endtime={endtime}
&timezone={timezone} &timeformat={timeformat}
&pagenum={pagenum} &numrecsperpage={numrecsperpage}
&deviceid={deviceid} &eventtype={eventtype}"
                },
                {
                  name: 'Fetch User Information',
                  endpoint: '/svc/bw/data/user?',
                  queryparameters: 'userid={n}'
                },
                {
                  name: 'Fetch User Preferences',
                  endpoint: '/svc/bw/data/user/preferences?',
                  queryparameters: 'finduserby={searchcriteria}
&value ={criteriavalue}'
                },
                {
                  name: 'Fetch Web API User Information',
                  endpoint: '/svc/bw/data/user/webapi?',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch Trunk Information By Trunk ID',
                  endpoint: '/svc/bw/data/trunk?=',
                  queryparameters: 'trunkid={n}'
                },
                {
                  name: 'Fetch Button Sheet Information by Search Criteria',
                  endpoint: '/svc/bw/data/user/button?',
                  queryparameters: 'finduserby={usersearchcriteria}
&uservalue={usersearchcriteriavalue}
&findbuttonsby={buttonsearchcriteria}
&buttonsearchvalue={buttonsearchcriteriavalue}
&excludeinvalid={excludeinvalid}
&excludeflag={excludeinvalidvalue}'
                },
                {
                  name: 'Fetch ResourceAOR Information',
                  endpoint: '/svc/bw/data/resourceaor?',
                  queryparameters: 'filtertype={filtertype} &pagenum={pagenum}
&numrecsperpage={numrecsperpage} &type={type}'
                },
                {
                  name: 'Fetch Personal Contacts For User',
                  endpoint: '/svc/bw/data/user/{loginname}/personal-contact?',
                  queryparameters: 'loginname filtertype={filtertype} &pagenum={pagenum}
&numrecsperpage={numrecsperpage}'
                },
                {
                  name: 'Fetch Point of Contact List For Personal Contact',
                  endpoint: '/svc/bw/data/user/{loginname}/personal-contact/{contactid}/poc',
                  queryparameters: 'loginname contactid'
                },
                {
                  name: 'Fetch Enterprise Directory Contacts',
                  endpoint: '/svc/bw/data/enterprise-contact?',
                  queryparameters: 'filtertype={filtertype} &pagenum={pagenum}
&numrecsperpage={numrecsperpage}'
                },
                {
                  name: 'Fetch Point Contacts List For Enterprise Contact',
                  endpoint: '/svc/bw/data/enterprise-contact/{contactid}/poc',
                  queryparameters: 'contactid'
                },
                {
                  name: 'Fetch Logon Session Information',
                  endpoint: '/svc/bw/data/user/logonsession?',
                  queryparameters: 'querystr={logicalexpression}
&numrecsperpage={number} &pagenum={number}
&timezone={timezone} &timeformat={timeformat}'
                },
                {
                  name: 'Fetch License Information',
                  endpoint: '/svc/bw/data/license?',
                  queryparameters: 'querystr={logicalexpression} &numrecsperpage={number}
&pagenum={number}'
                },
                {
                  name: 'Fetch Location Information',
                  endpoint: '/svc/bw/data/location?querystr=',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch Account Policy',
                  endpoint: '/svc/bw/data/account-policy?querystr=',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch Codec Profile',
                  endpoint: '/svc/bw/data/codec-profile?querystr=',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch Authentication Domain',
                  endpoint: '/svc/bw/data/authentication-domain?
querystr=',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch User Groups',
                  endpoint: '/svc/bw/data/group?',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch Hunt Groups',
                  endpoint: '/svc/bw/data/group/hunt?',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch Roles',
                  endpoint: '/svc/bw/data/role?',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch All Users From A User Group',
                  endpoint: '/svc/bw/data/group/member?',
                  queryparameters: 'querystr={logicalexpression}
&numrecsperpage={numrecsperpage}
&pagenum={pagenum}
&lastuserid={lastuserid}'
                },
                {
                  name: 'Fetch Key Codes Information',
                  endpoint: '/svc/bw/data/key-codes?',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch Zone Inventory Information',
                  endpoint: '/svc/bw/data/inventory/zone?',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch Device Inventory Information',
                  endpoint: '/svc/bw/data/inventory/device?',
                  queryparameters: 'querystr={logicalexpression} &numrecsperpage={number}
&pagenum={number}'
                },
                {
                  name: 'Fetch SBC Inventory Information',
                  endpoint: '/svc/bw/data/inventory/sessionbordercontroller?',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch Voice Recorder Inventory Information',
                  endpoint: '/svc/bw/data/inventory/voicerecorder?',
                  queryparameters: 'querystr={logicalexpression}'
                },
                {
                  name: 'Fetch Voice Recorder Inventory Information',
                  endpoint: '/svc/bw/data/inventory/voicerecorder?',
                  queryparameters: 'querystr={logicalexpression}'
                }])