module ContractsHelper
  def locale_date(date, format, language)
    I18n.l( date, format: format, locale: language)
  end

  def today_date
    Time.now.strftime('%Y-%m-%d')
  end

  def zip_code(full_address)
    full_address.split(', ')[0]
  end

  def street(full_address)
    full_address.split(', ')[1..-3].join(', ')
  end

  def city(full_address)
    full_address.split(', ')[-2]
  end

  def country(full_address)
    full_address.split(', ')[-1]
  end

  def person_type_for_locale(type, language)
    t("fields.#{language}.#{type.downcase.split(' ').join('_')}")
  end
end
