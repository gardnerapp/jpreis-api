require "test_helper"

class TokenFiltersTest < ActionDispatch::IntegrationTest
  setup do
    @params =  {"api": {:foo => :bar}}
    @management = management_apis :one
  end

  %w[data_path call_call_path cti_call_path
     data_status_monitor_path device_call_path monitoring_call_path].each do |path|
    test "#{path} filters for token" do
      post eval(path, binding, __FILE__, __LINE__), params: @params
      assert_response :redirect, "#{path} did not redirect"
      assert_not flash.nil?, "#{path} did not lash after redirect "
    end
  rescue StandardError
    next
  end

  test 'Management controller filters for presence of account management token' do
    post management_call_path, params: { api: { id: @management.id } }
    assert_response :redirect
    assert_not flash.nil?
  end
end
