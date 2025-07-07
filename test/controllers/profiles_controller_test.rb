require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin)
    @user = users(:user)
    sign_in @admin
  end

  test "admin should get index" do
    get profiles_path
    assert_response :success
  end

  test "user should get their profile show" do
    sign_in @user
    get profile_path
    assert_response :success
  end

  test "user should get edit profile" do
    sign_in @user
    get edit_profile_path
    assert_response :success
  end

  test "user should update profile" do
    sign_in @user
    patch profile_path, params: {
      user: {
        phone: "123456789",
        eircode: "D06XYZ"
      }
    }
    assert_redirected_to profile_path
  end
end
