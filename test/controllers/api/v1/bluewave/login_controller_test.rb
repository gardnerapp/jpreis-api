require "test_helper"

class Api::V1::Bluewave::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get api_v1_bluewave_login_login_url
    assert_response :success
  end
end
