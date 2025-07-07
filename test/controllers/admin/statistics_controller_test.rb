require "test_helper"

class Admin::StatisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin)
    sign_in @admin
  end

  test "should get index" do
    get admin_statistics_path
    assert_response :success
  end
end
