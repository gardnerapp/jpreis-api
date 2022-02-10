module ControllerHelper

  # list of IP's to choose from in form
  IP_ADDRESSES = [
    %w[127.0.0.1 127.0.0.1],
    %w[127.0.10.1 127.0.10.1],
    %w[198.35.66.0 198.35.66.0]
  ].freeze

  # creates hash from POST request and sets token
  def set_params_and_token(token_type)
    @params = params[:api].to_unsafe_h
    @token = cookies["#{token_type}_token"]
  end

end
