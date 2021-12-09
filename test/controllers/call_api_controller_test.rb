require "test_helper"

class CallApiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get call_api_index_url
    assert_response :success
  end

  test "should get show" do
    get call_api_show_url
    assert_response :success
  end
end
