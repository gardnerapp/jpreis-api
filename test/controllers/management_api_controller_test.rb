require 'test_helper'

class ManagementApiControllerTest < ActionDispatch::IntegrationTest
  setup do
    @management = management_apis :one
  end
  test 'should get index' do
    get management_api_index_url
    assert_response :success
  end

  test 'should get show' do
    get management_api_path @management
    assert_response :success
  end
end
