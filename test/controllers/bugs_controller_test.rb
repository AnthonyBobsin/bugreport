require 'test_helper'

class BugsControllerTest < ActionController::TestCase

  def setup
    @user = users(:user)
    @bug = bugs(:first)
  end

  test "Should create new bug" do
    sign_in @user
    bug = Bug.new
    bug.title = "Test Bug"
    bug.description = "This is a test bug."
    bug.priority = "Low"
    bug.is_closed = false
    assert bug.save
  end

  test "Can't create bug without title" do
    sign_in @user
    bug = Bug.new
    bug.description = "This is a test bug."
    bug.priority = "Low"
    bug.is_closed = false
    assert_not bug.save
  end

  test "Can't create bug without description" do
    sign_in @user
    bug = Bug.new
    bug.title = "Test bug"
    bug.priority = "Low"
    bug.is_closed = false
    assert_not bug.save
  end

  test "Should close bug" do
    patch :close, id: @bug.id
    assert_equal "You successfully closed the bug", flash[:success]
  end

end
