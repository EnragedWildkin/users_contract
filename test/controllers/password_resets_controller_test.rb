require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase
  def test_should_send_user_email_with_reset_password_and_redirect_to_root_path
    post :create, email: user.email

    assert_redirected_to root_path
    assert_equal 'Instructions have been sent to your email.', flash[:notice]
  end

  def test_get_edit_with_existing_user_renders_edit_template
    User.expects(:load_from_reset_password_token).returns(user)

    get :edit, id: user.id

    assert_template :edit
    assert_response :success
  end

  def test_get_edit_with_no_existing_user_redirects_to_log_in_path
    User.expects(:load_from_reset_password_token).returns(nil)

    get :edit, id: user.id

    assert_redirected_to log_in_path
    assert_equal 'Please login first', flash[:alert]
  end

  def test_should_update_password_and_redirect_to_root_path
    User.expects(:load_from_reset_password_token).returns(user)

    patch :update, id: user.id, user: { password: 'newPassword', password_confirmation: 'newPassword' }

    assert_redirected_to root_path
    assert_equal 'Password was successfully updated.', flash[:notice]
  end

  def test_should_not_update_password_and_render_edit_template_with_invalid_passwords
    User.expects(:load_from_reset_password_token).returns(user)

    patch :update, id: user.id, user: { password: 'password_1', password_confirmation: 'password_2' }

    assert_template :edit
  end

  def test_should_not_update_password_with_no_existing_user_and_redirect_to_log_in_path
    User.expects(:load_from_reset_password_token).returns(nil)

    patch :update, id: user.id, user: { password: 'password_1', password_confirmation: 'password_2' }

    assert_redirected_to log_in_path
    assert_equal 'Please login first', flash[:alert]
  end

  def user
    users(:john)
  end
end
