require 'test_helper'

class UserFieldTest < ActiveSupport::TestCase
  def setup
    @user_field ||= user_fields(:en_john_field)
  end

  def test_short_name
    assert_equal 'Ivanov Ivan', @user_field.short_name
  end

  def test_full_name
    assert_equal 'Ivanov Ivan Ivanovych', @user_field.full_name
  end

  def test_name_with_initials
    assert_equal 'Ivanov I.I.', @user_field.name_with_initials
  end

  def test_should_pass_if_user_field_valid
    assert @user_field.valid?
  end
end
