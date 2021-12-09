class ApplicationController < ActionController::Base
  include FilterHelper
  #  CTI – to use the CTI Monitor API, Call API, and Device API
  # • DATA – to use the Data API
  # • MONITORING – to use the Monitoring API
  # • ADMINACCTMGMT – to use the Admin Account Management API
  # • ENDUSERACCTMGMT – to use the End User Account Management API
end
