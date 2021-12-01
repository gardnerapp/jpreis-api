# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
                  #TODO fix
                  name: 'Fetch Personal Contacts For User',
                  endpoint: '/svc/bw/data/user/{loginname}/personal-
contact?',
                  queryparameters: 'filtertype={filtertype} &pagenum={pagenum}
&numrecsperpage={numrecsperpage}'
                },
                {
                  # TODO fix
                  name: 'Fetch Point of Contact List For Personal Contact',
                  endpoint: '/svc/bw/data/user/{loginname}/personal-contact/
{contactid}/poc',
                  queryparameters: ''
                },
                {
                  name: 'Fetch Enterprise Directory Contacts',
                  endpoint: '/svc/bw/data/enterprise-contact?',
                  queryparameters: 'filtertype={filtertype} &pagenum={pagenum}
&numrecsperpage={numrecsperpage}'
                },
                { # TODO
                  name: 'Fetch Point Contacts List For Enterprise Contact',
                  endpoint: '/svc/bw/data/enterprise-contact/{contactid}/poc',
                  queryparameters: ''
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
                },
                { # TODO fix
                  name: 'Create a Data Status Monitor Resource',
                  endpoint: '/svc/bw/data/status-monitor',
                  queryparameters: ''
                },
                { # TODO fix
                  name: 'Update a Data Status Monitor Resource',
                  endpoint: '/svc/bw/data/status-monitor/',
                  queryparameters: 'monitorID{monitorId}'
                },
                { # TODO fix
                  name: 'Fetch Details of a Data Status Monitor Resource',
                  endpoint: '/svc/bw/data/status-monitor/',
                  queryparameters: 'monitorID{monitorId}'
                },
                { # TODO fix
                  name: 'Fetch Resource Updates By Polling the Data Status Monitor',
                  endpoint: '/svc/bw/data/status-monitor/event/',
                  queryparameters: 'monitorID{monitorId}'
                },
                { # TODO fix
                  name: 'Delete A Data Status Monitor Resource',
                  endpoint: '/svc/bw/data/status-monitor/',
                  queryparameters: 'monitorID{monitorId}'
                },





               ])