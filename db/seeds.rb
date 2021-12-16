# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

# Create Call API calls
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
                },
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
                      },])

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
                },])