require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def test_get_index_assigns_users
    login(:admin)
    get :index

    assert_response :success
    assert_not_nil assigns(:users)
  end

  def test_should_show_user
    login(:admin)
    get :show, id: users(:john)

    assert_response :success
  end

  def test_should_redirect_to_root_path_if_permission_denied
    login(:john)
    get :show, id: users(:sam)

    assert_redirected_to user_path(users(:john))
    assert_equal 'Permission denied', flash[:alert]
  end

  def test_get_new_renders_new_template
    login(:admin)
    get :new

    assert_response :success
    assert_template :new
  end

  def test_get_edit_renders_edit_template
    login(:admin)
    get :edit, id: users(:john)

    assert_response :success
    assert_template :edit
  end

  def test_should_create_user_with_valid_params
    login(:admin)
    assert_difference('User.count') do
      post :create, user: valid_user_params
    end

    assert_redirected_to root_path
    assert_equal 'User was successfully created.', flash[:notice]
  end

  def test_should_create_user_without_login_fields_if_admin
    login(:admin)
    post :create, user: invalid_user_params

    assert_redirected_to root_path
    assert_equal 'User was successfully created.', flash[:notice]
  end

  def test_should_create_user_without_login_fields_if_common_user
    post :create, user: invalid_user_params

    assert_template :new
  end

  def test_should_update_user
    login(:admin)
    patch :update, id: users(:john), user: { taxpayer_id: 111 }

    assert_redirected_to root_path
    assert_equal 'User was successfully updated.', flash[:notice]
  end

  def test_should_not_update_user_if_user_params_invalid
    login(:admin)
    patch :update, id: users(:admin), user: { password: '1', password_confirmation: '2' }

    assert_template :edit
  end

  def test_should_destroy_user
    login(:admin)
    assert_difference('User.count', -1) do
      delete :destroy, id: users(:john)
    end

    assert_redirected_to root_path
    assert_equal 'User was successfully destroyed.', flash[:notice]
  end

  def valid_user_params
    {
      email: "new.user@email.com",
      password: 'secret',
      password_confirmation: 'secret'
    }
  end

  def invalid_user_params
    {
      email: '',
      password: '',
      password_confirmation: ''
    }
  end
end
