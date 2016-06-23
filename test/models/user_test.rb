require 'test_helper'

class UserFieldTest < ActiveSupport::TestCase
  def test_should_pass_if_user_has_admin_role
    assert admin.admin?
  end

  def test_skip_login_fields_validation_when_email_blank_and_permission
    user = User.new(email: '')
    user.skip_email_and_password_validation
    user.save

    assert_nil user.email
    assert user.valid?
  end

  def test_validate_login_fields_when_permission_denied
    user = User.create(email: '')

    assert_not user.valid?
  end

  def admin
    @user ||= users(:admin)
  end
end
