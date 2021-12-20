require "test_helper"

class DataStatusMonitorApiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get data_status_monitor_api_index_url
    assert_response :success
  end

  test "should get show" do
    get data_status_monitor_api_show_url
    assert_response :success
  end
end
