module ContractsHelper
  def locale_date(date, format, language)
    I18n.l( date, format: format, locale: language)
  end

  def today_date
    Time.now.strftime('%Y-%m-%d')
  end
end
