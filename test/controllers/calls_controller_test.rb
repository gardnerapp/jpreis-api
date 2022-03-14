require "test_helper"

class CallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @call = calls(:one)
  end

  test "should get index" do
    get calls_url
    assert_response :success
  end

  test "should show call" do
    get calls_url(@call)
    assert_response :success
  end

end
