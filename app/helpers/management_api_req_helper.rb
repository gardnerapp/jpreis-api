module ManagementApiReqHelper
  include RequestHelper

  def admin_req
    @url = "https://#{@params[:ip]}#{@params[:endpoint]}"
    header_token(@token)
    basic_auth(params['userName'], params['password'])
    if !@management.xml_params? # fetch admin account pass word hash request
      @url += "loginName=#{@params[:loginName]}"
    else # change admin acct psswrd request
      @body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<ns1:ChangeAdminUserPassword xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:LoginName>#{@params['LoginName']}</ns1:LoginName>
<ns1:NewPassword>#{@params['NewPassword']}</ns1:NewPassword>
<ns1:CurrentPassword>#{@params['CurrenPassword']}</ns1:CurrentPassword>
<ns1:PasswordChangeMode>false</ns1:PasswordChangeMode>
</ns1:ChangeAdminUserPassword>"
    end
    send_req
  end

  def create_an_end_user_account
    header_token @token
    @url = "https://#{@params[:ip]}}#{@endpoint}"
    @body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<ns1:CreateUser xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:UserInfo>
<ns1:LoginName>#{@params['LoginName']}</ns1:LoginName>
<ns1:Password>#{@params['Password']}</ns1:Password>
<ns1:PasswordChangeMode>#{@params['PasswordChangeMode']}/ns1:PasswordChangeMode>
<ns1:DateDisplayFormat>MM_dd_yy</ns1:DateDisplayFormat>
<ns1:TimeDisplayFormat>h_mm_ss_a</ns1:TimeDisplayFormat>
<ns1:IsTemporary>#{@params['IsTemporary']}</ns1:IsTemporary>
<ns1:AuthType>#{@params['AuthType']}</ns1:AuthType>
<ns1:FirstName>#{@params['FirstName']}</ns1:FirstName>
<ns1:LastName>#{@params['LastName']}</ns1:LastName>
<ns1:Locale>#{@params['Locale']}</ns1:Locale>
<ns1:Title/>
<ns1:Email>#{@params['Email']}</ns1:Email>
<ns1:LocationId>#{@params['LocationId']}</ns1:LocationId>
<ns1:AccountPolicyId>#{@params['AccountPolicyId']}</ns1:AccountPolicyId>
</ns1:UserInfo>
</ns1:CreateUser>"
    send_req
  end

  def assign_or_remove_role
    header_token @token
    @url = "https://#{@params[:ip]}#{@endpoint}#{@params['operation']}"
    @body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<ns1:RoleAssignment xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:UserIdentifier>
<ns1:LoginName>#{@params['LoginName']}</ns1:LoginName>
</ns1:UserIdentifier>
<ns1:RoleNamesList>"
    @params['RoleNames'].split.each do |role_name|
      @body += "<ns1:RoleName>#{role_name}</ns1:RoleName>"
    end
    @body += "</ns1:RoleNamesList>
</ns1:RoleAssignment>"
    send_req
  end

  def add_or_remove_user_from_group
    header_token @token
    @url = "https://#{@params[:ip]}#{@endpoint}#{@params['operation']}"
    @body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<ns1:GroupMembership xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:UserIdentifier>
<ns1:UserId>#{@params['UserId']}</ns1:UserId>
</ns1:UserIdentifier>
<ns1:GroupIdentifier>
<ns1:GroupId>#{@params['GroupId']}</ns1:GroupId>
</ns1:GroupIdentifier>
</ns1:GroupMembership>"
    send_req
  end

  def assign_or_revoke_license
    header_token @token
    @url = "https://#{@params[:ip]}#{@endpoint}#{@params['operation']}"
    @body = "?xml version=\"1.0\" encoding=\"UTF-8\"?>
<ns1:LicenseManagement xmlns:ns1=”http://www.ipc.com/bw” xmlns:xsi=\"http://
    www.w3.org/2001/XMLSchema-instance\">
<ns1:UserIdentifier>
<ns1:UserId>#{@params['UserID']}</ns1:UserId>
</ns1:UserIdentifier>
<ns1:LicenseFeatureCode>#{@params['LicenseFeatureCode']}</ns1:LicenseFeatureCode>
</ns1:LicenseManagement>"
    send_req
  end

  def add_point_of_contact_for_user
    header_token @token
    @url = "https://#{@params[:ip]}#{@endpoint}#{@params['operation']}"
    @body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<ns1:PointOfContactManagement xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:UserIdentifier>
<ns1:UserId>#{@params['UserId']}</ns1:UserId>
</ns1:UserIdentifier>
<ns1:PointOfContactDetails>
<ns1:ButtonLabel>#{@params['ButtonLabel']}</ns1:ButtonLabel>
<ns1:MediaType>#{@params['MediaType']}</ns1:MediaType>
<ns1:POCType>#{@params['POCType']}</ns1:POCType>
<ns1:Data>#{@params['Data']}</ns1:Data>
<ns1:PreferredPOC>#{@params['PreferredPOC']}</ns1:PreferredPOC>
</ns1:PointOfContactDetails>
</ns1:PointOfContactManagement>"
    send_req
  end

  def change_user_account_password
    header_token @token
    @url = "https://#{@params[:ip]}#{@endpoint}"
    @body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<ns1:ChangeEndUserPassword xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:UserIdentifier>
<ns1:LoginName>#{@params['LoginName']}</ns1:LoginName>
</ns1:UserIdentifier>
<ns1:NewPassword>#{@params['NewPassword']}</ns1:NewPassword>
<ns1:PasswordChangeMode>#{@params['PasswordChangeMode']}</ns1:PasswordChangeMode>
</ns1:ChangeEndUserPassword>"
    send_req
  end

  def update_user_attributes
    header_token @token
    @url = "https://#{@params[:ip]}#{@endpoint}"
    @body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<ns1:UpdateUser xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:UpdateUserInfo>
<ns1:UserId>#{@params['UserId']}</ns1:UserId>
<ns1:FirstName>#{@params['FirstName']}</ns1:FirstName>
<ns1:LastName>#{@params['LastName']}</ns1:LastName>
</ns1:UpdateUserInfo>
</ns1:UpdateUser>"
    send_req
  end

  def update_user_trader_features
    header_token @token
    @url = "https://#{params[:ip]}#{@endpoint}"
    @body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<ns1:UpdateTraderFeatures xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:UserIdentifier>
<ns1:LoginName>#{@params['LoginName']}</ns1:LoginName>
</ns1:UserIdentifier>
<ns1:TraderInfo>
<ns1:PersonalExtension>#{@params['PersonalExtension']}</ns1:PersonalExtension>
<ns1:IntercomExtension>#{@params['IntercomExtension']}</ns1:IntercomExtension>
<ns1:HuntGroupId>#{@params['HuntGroupId']}</ns1:HuntGroupId>
<ns1:UnigyLocationId>#{@params['UnigyLocationId']}</ns1:UnigyLocationId>
</ns1:TraderInfo>
<ns1:GeneralInfo>
<ns1:BillingGroupId>#{@params['BillingGroupId']}</ns1:BillingGroupId>
<ns1:AutoSelectHold>#{@params['AutoSelectHold']}</ns1:AutoSelectHold>
<ns1:Language>#{@params['Language']}</ns1:Language>
</ns1:GeneralInfo>
<ns1:UsagePreferences>
<ns1:AllowPrivacyToggle>#{@params['AllowPrivacyToggle']}</ns1:AllowPrivacyToggle>
<ns1:AlternateHandsetSelectTimeout>#{@params['AlternateHandsetSelectTimeout']}</
ns1:AlternateHandsetSelectTimeout>
<ns1:BlockingToneOnSpeakerMute>#{@params['BlockingToneOnSpeakerMute']}</ns1:BlockingToneOnSpeakerMute>
<ns1:CLIDisplayPreference>#{@params['CLIDisplayPreference']}</ns1:CLIDisplayPreference>
<ns1:CodecProfileId>#{@params['CodecProfileId']}</ns1:CodecProfileId>
<ns1:CreateSimplexPresetBroadcast>#{@params['CreateSimplexPresetBroadcast']}</
ns1:CreateSimplexPresetBroadcast>
<ns1:Custom1>#{@params['Custom1']}</ns1:Custom1>
<ns1:Custom2>#{@params['Custom2']}</ns1:Custom2>
<ns1:Custom3>#{@params['Custom3']}</ns1:Custom3>
<ns1:Custom4>#{@params['Custom4']}</ns1:Custom4>
<ns1:DeskLocation>#{@params['DeskLocation']}</ns1:DeskLocation>
<ns1:DivertICMCallsTo>#{@params['DivertICMCallsTo']}</ns1:DivertICMCallsTo>
<ns1:DurForICMRNADiversion>#{@params['DurForICMRNADiversion']}</ns1:DurForICMRNADiversion>
<ns1:FixedButtonRows>#{@params['FixedButtonRows']}</ns1:FixedButtonRows>
<ns1:FloatAllIncomingCalls>#{@params['FloatAllIncomingCalls']}</ns1:FloatAllIncomingCalls>
<ns1:FloatCallsOnHold>#{@params['FloatCallsOnHold']}</ns1:FloatCallsOnHold>
<ns1:FloatingButtonRows>#{@params['FloatingButtonRows']}</ns1:FloatingButtonRows>
<ns1:FloatPriorityProfileId>#{@params['FloatPriorityProfileId']}</ns1:FloatPriorityProfileId>
<ns1:ForceTalkbackMute>#{@params['ForceTalkbackMute']}</ns1:ForceTalkbackMute>
<ns1:HandsetButtonActions>#{@params['HandsetButtonActions']}</ns1:HandsetButtonActions>
<ns1:HandsetCallMuteOption>#{@params['HandsetCallMuteOption']}</ns1:HandsetCallMuteOption>
<ns1:HandsetSelectMode>#{@params['HandsetSelectMode']}</ns1:HandsetSelectMode>
<ns1:HomeZoneId>#{@params['HomeZoneId']}</ns1:HomeZoneId>
<ns1:ICMDiversionCondition>#{@params['ICMDiversionCondition']}</ns1:ICMDiversionCondition>
<ns1:ICMDiversionMode>#{@params['ICMDiversionMode']}</ns1:ICMDiversionMode>
<ns1:ICMRecording>#{@params['ICMRecording']}</ns1:ICMRecording>
<ns1:ICMSplashTone>#{@params['ICMSplashTone']}</ns1:ICMSplashTone>
<ns1:ImplicitHunt>#{@params['ImplicitHunt']}</ns1:ImplicitHunt>
<ns1:InfiniteRing>#{@params['InfiniteRing']}</ns1:InfiniteRing>
<ns1:InterDigitTimeout>#{@params['InterDigitTimeout']}</ns1:InterDigitTimeout>
<ns1:IntrusionTone>#{@params['IntrusionTone']}</ns1:IntrusionTone>
<ns1:LatchGroupTalkback1>#{@params['LatchGroupTalkback1']}</ns1:LatchGroupTalkback1>
<ns1:LatchGroupTalkback2>#{@params['LatchGroupTalkback2']}</ns1:LatchGroupTalkback2>
<ns1:MaintainICMDivertUponLogOn>#{@params['MaintainICMDivertUponLogOn']}</ns1:MaintainICMDivertUponLogOn>
<ns1:MaxDigitForTheDivertToNumber>#{@params['MaxDigitForTheDivertToNumber']}</ns1:MaxDigitForTheDivertToNumber>
<ns1:MusicOnHoldId>#{@params['MusicOnHoldId']}</ns1:MusicOnHoldId>
<ns1:RecordOnDemand>#{@params['RecordOnDemand']}</ns1:RecordOnDemand>
<ns1:RecordWarningTone>#{@params['RecordWarningTone']}</ns1:RecordWarningTone>
<ns1:SpeakerMicMuteOption>#{@params['SpeakerMicMuteOption']}</ns1:SpeakerMicMuteOption>
<ns1:SpeakerRetryTime>#{@params['SpeakerRetryTime']}</ns1:SpeakerRetryTime>
<ns1:UserPrivacyDefaultsToEnabled>#{@params['UserPrivacyDefaultsToEnabled']}</
ns1:UserPrivacyDefaultsToEnabled>
</ns1:UsagePreferences>
</ns1:UpdateTraderFeatures>"
    send_req
  end

  def force_log_out
    header_token @token
    @url = "https://#{@params[:ip]}#{@endpoint}"
    @body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<ns1:CDISession xmlns:ns1=”http://www.ipc.com/bw” xmlns:xsi=\"http://
    www.w3.org/2001/XMLSchema-instance\">
<ns1:UserIdentifier>
<ns1:UserId>#{@params['UserId']}</ns1:UserId>
</ns1:UserIdentifier>
<ns1:LogOutInfo>
<ns1:IgnoreOpenHandSetCalls>#{@params['IgnoreOpenHandSetCalls']}</ns1:IgnoreOpenHandSetCalls>
</ns1:LogOutInfo>
</ns1:CDISession>"
    send_req
  end

  def update_user_button_settings
    header_token @token
    @url = "https://#{params[:ip]}#{@endpoint}"
    @body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<ns1:UpdateEndUserButton xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:UserIdentifier>
<ns1:UserId>#{@params['UserId']}</ns1:UserId>
</ns1:UserIdentifier>
<ns1:ButtonList>
<ns1:Button>
<ns1:ButtonBasicInfo>
<ns1:ButtonIdentifier>
<ns1:ButtonId>#{@params['ButtonId']}</ns1:ButtonId>
</ns1:ButtonIdentifier>
<ns1:ButtonType>#{@params['ButtonType']}</ns1:ButtonType>
<ns1:ButtonLabel>#{@params['ButtonLabel']}</ns1:ButtonLabel>
<ns1:LockedForProgrammingAtCDI>#{@params['LockedForProgrammingAtCDI']}</
ns1:LockedForProgrammingAtCDI>
</ns1:ButtonBasicInfo>
<ns1:ButtonDetails>
<ns1:ResourceButtonInfo>
<ns1:IncomingActionRings>#{@params['IncomingActionRings']}</ns1:IncomingActionRings>
<ns1:IncomingActionPriority>#{@params['IncomingActionPriority']}</ns1:IncomingActionPriority>
<ns1:IncomingActionFloat>#{@params['IncomingActionFloat']}</ns1:IncomingActionFloat>
<ns1:DisplayIncomingCLI>#{@params['DisplayIncomingCLI']}</ns1:DisplayIncomingCLI>
<ns1:RingTone>#{@params['RingTone']}</ns1:RingTone>
<ns1:DisplayInCallHistory>#{@params['DisplayInCallHistory']}</ns1:DisplayInCallHistory>
<ns1:ResourceAORInfo>
<ns1:ResourceAORId>#{@params['ResourceAORId']}</ns1:ResourceAORId>
<ns1:LineAppearance>#{@params['LineAppearance']}</ns1:LineAppearance>
</ns1:ResourceAORInfo>
<ns1:SpeedDialType>#{@params['SpeedDialType']}</ns1:SpeedDialType>
<ns1:AutoSignal>#{@params['AutoSignal']}</ns1:AutoSignal>
</ns1:ResourceButtonInfo>
</ns1:ButtonDetails>
</ns1:Button>
</ns1:ButtonList>
</ns1:UpdateEndUserButton>"
    send_req
  end


end
