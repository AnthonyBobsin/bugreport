require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @user = users(:user)
  end

  test "should get home page" do
    get :home
    assert_response :success
  end

  test "navbar changes upon sign in" do
    get :home
    assert_select '.switcharoo', "Sign up"
    sign_in @user
    get :home
    assert_select '.switcharoo', "Report Bug"
  end
end
