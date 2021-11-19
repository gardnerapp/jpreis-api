require "test_helper"

class ApiAuthControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get api_auth_new_url
    assert_response :success
  end
end
