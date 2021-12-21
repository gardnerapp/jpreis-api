require "test_helper"

class MonitoringApiControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get monitoring_api_show_url
    assert_response :success
  end
end
