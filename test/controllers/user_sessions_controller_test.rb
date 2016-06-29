require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  def test_get_new_renders_new_template
    get :new

    assert_response :success
    assert_template :new
  end

  def test_should_login_user_and_redirect_to_root_path
    post :create, email: common_user.email, password: 'secret'

    assert_redirected_to root_path
    assert_equal 'Login successful', flash[:notice]
  end

  def test_should_not_login_user_and_redirect_to_root_path_if_email_invalid
    post :create, email: "some@email.com", password: 'some-password'

    assert_template :new
    assert_equal 'Login failed', flash[:alert]
  end

  def test_should_logout
    login(:john)
    delete :destroy

    assert_redirected_to root_path
    assert_equal 'Logged out!', flash[:notice]
  end

  def common_user
    users(:john)
  end
end
