require 'test_helper'

class RoutesControllerTest < ActionController::TestCase
  def test_should_change_root_path_to_users_index_action_when_admin
    login(:admin)

    get :root

    assert_redirected_to users_path
  end

  def test_should_change_root_path_to_users_show_action_when_common_user
    login(:john)

    get :root

    assert_redirected_to user_path(users(:john))
  end

  def test_should_change_root_path_to_log_in_path_when_user_not_log_in
    get :root

    assert_redirected_to log_in_path
  end
end
