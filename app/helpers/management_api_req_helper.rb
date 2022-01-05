module ManagementApiReqHelper
  include RequestHelper

  def admin_req(params, token)
    @method = @management.method
    @url = "https://#{params[:ip]}#{params[:endpoint]}"
    header_token(token)
    basic_auth(params['userName'], params['password'])
    if !@management.xml_params? # fetch admin account pass word hash request
      @url += "loginName=#{params[:loginName]}"
    else # change admin acct psswrd request
      @body = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<ns1:ChangeAdminUserPassword xmlns:ns1=\"http://www.ipc.com/bw\">
<ns1:LoginName>#{params['LoginName']}</ns1:LoginName>
<ns1:NewPassword>#{params['NewPassword']}</ns1:NewPassword>
<ns1:CurrentPassword>#{params['CurrenPassword']}</ns1:CurrentPassword>
<ns1:PasswordChangeMode>false</ns1:PasswordChangeMode>
</ns1:ChangeAdminUserPassword>"
    end
    send_req
  end

end
