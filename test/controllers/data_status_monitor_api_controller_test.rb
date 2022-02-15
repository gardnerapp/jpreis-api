require "test_helper"

class DataStatusMonitorApiControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_status = data_status_monitor_apis :one
  end
  test "should get index" do
    get data_status_monitor_api_index_path
    assert_response :success
  end

  test "should get show" do
    get data_status_monitor_api_path @data_status
    assert_response :success
  end
end
