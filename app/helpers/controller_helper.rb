module ControllerHelper

  def set_params_and_token(token_type)
    @params = params[:api].to_unsafe_h
    @token = cookies["#{token_type}_token"]
  end

end
