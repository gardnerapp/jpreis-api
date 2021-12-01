require "test_helper"

class Api::V1::TestControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get api_v1_test_test_url
    assert_response :success
  end
end
