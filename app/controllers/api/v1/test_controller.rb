class Api::V1::TestController < ActionController::API
  def test
    render json: {auth_token: "$Arfwctuth"}
  end
end
