module ContractsHelper
  def locale_date(date, format, language)
    I18n.l( date, format: format, locale: language)
  end
end
