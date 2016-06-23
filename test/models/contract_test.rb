require 'test_helper'

class ContractTest < ActiveSupport::TestCase
  def test_should_be_valid_with_contract_number
    assert contracts(:valid).valid?
  end

  def test_should_be_invalid_without_contract_number
    assert_not contracts(:invalid).valid?
  end
end
