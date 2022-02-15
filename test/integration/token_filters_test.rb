require "test_helper"

class TokenFiltersTest < ActionDispatch::IntegrationTest
  test 'Data token filtered for' do
    post data_path, params: {"api": {:foo => :bar}}
    assert_response :redirect
  end
end
