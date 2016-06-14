module ContractsHelper
  def locale_date(date, format, language)
    I18n.l( Time.now, format: format, locale: language)
  end
end
