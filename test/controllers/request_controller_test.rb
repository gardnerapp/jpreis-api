require "test_helper"

class RequestControllerTest < ActionDispatch::IntegrationTest
  test "should get set" do
    get request_set_url
    assert_response :success
  end

  test "should get send" do
    get request_send_url
    assert_response :success
  end
end
