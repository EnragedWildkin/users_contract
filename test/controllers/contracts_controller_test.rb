require 'test_helper'

class ContractsControllerTest < ActionController::TestCase
  def setup
    login(:admin)
  end

  def test_get_new_renders_new_template
    get :new, user_id: users(:john)

    assert_response :success
    assert_template :new
  end

  def test_should_generate_contract_with_successfull_response
    get :generate, user_id: users(:john), contract: valid_contract_params, commit: 'Preview'

    assert_response :success
  end

  def test_generate_action_return_pdf_format_if_params_commit_equal_pdf
    get :generate, user_id: users(:john), contract: valid_contract_params, commit: 'PDF'

    assert_equal "application/pdf", response.content_type
  end

  def test_should_render_new_template_if_contract_invalid
    get :generate, user_id: users(:john), contract: invalid_contract_params, commit: 'PDF'

    assert_template :new
  end

  def valid_contract_params
    {
      number: "asd",
      start_date: "2016-06-21",
      end_date: "2016-06-21",
      draft_id: drafts(:sor_ua).id,
      person_type_id: person_types(:pe).id
    }
  end

  def invalid_contract_params
    {
      start_date: "2016-06-21",
      end_date: "2016-06-21",
      draft_id: drafts(:sor_ua).id,
      person_type_id: person_types(:pe).id
    }
  end
end
