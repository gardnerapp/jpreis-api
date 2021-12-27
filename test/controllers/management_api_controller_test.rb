require "test_helper"

class ManagementApiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get management_api_index_url
    assert_response :success
  end

  test "should get show" do
    get management_api_show_url
    assert_response :success
  end
end
