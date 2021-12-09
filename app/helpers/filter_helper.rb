module FilterHelper
  %i[cti data monitoring adminacctmgmt enduseracctmgmt].each do |token|
    define_method "#{token}_token_filter" do
      unless cookies["#{token}_token"]
        flash[:danger] = "No #{token} token provided, please start a session"
        redirect_to sessions_new_path
      end
    end
  end
end
