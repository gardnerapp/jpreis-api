require 'test_helper'

class MonitoringApiControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monitoring = monitoring_apis :one
  end
  test 'should get index' do
    get monitoring_api_path
    assert_response :success
  end
  test 'Should get show' do
    get monitoring_api_path @monitoring
    assert_response :success
  end
end
