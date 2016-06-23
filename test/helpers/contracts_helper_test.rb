require 'test_helper'

class ContractsHelperTest < ActionView::TestCase
  def test_locale_date_method_returns_date_in_different_languages
    assert_equal '17 June 2016', locale_date(contract.start_date, "%d %B %Y", :en)
    assert_equal '17 червня 2016', locale_date(contract.start_date, "%d %B %Y", :ua)
    assert_equal '17 июня 2016', locale_date(contract.start_date, "%d %B %Y", :ru)
  end

  def test_today_date
    assert_equal Time.now.strftime('%Y-%m-%d'), today_date
  end

  def test_zip_code
    assert_equal '88888', zip_code(address)
  end

  def test_street_name
    assert_equal 'Some Str.', street(address)
  end

  def test_city_name
    assert_equal 'Lviv', city(address)
  end

  def test_country_name
    assert_equal 'Ukraine', country(address)
  end

  def test_person_type_for_locale_returns_person_type_in_different_languages
    assert_equal 'PE', person_type_for_locale(person_type, :en)
    assert_equal 'ФОП', person_type_for_locale(person_type, :ua)
    assert_equal 'ИП', person_type_for_locale(person_type, :ru)
  end

  def person_type
    person_types(:pe).name
  end

  def contract
    contracts(:valid)
  end

  def address
    user_fields(:en_john_field).address
  end
end
