require "test_helper"

class CallApiControllerTest < ActionDispatch::IntegrationTest
  setup do
    @call = call_apis :one
  end

  test "should get index" do
    get call_api_index_url
    assert_response :success
  end

  test "should get show" do
    get call_api_path @call
    assert_response :success
  end
end
