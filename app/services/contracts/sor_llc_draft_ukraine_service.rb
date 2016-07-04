class Contracts::SorLlcDraftUkraineService
  def generate
    Template.find_or_create_by(name: 'sor-llc-draft-ukraine') do |template|
      template.body = ".sor_llc_contract\r\n  %table\r\n    %tr\r\n      %td\r\n        %p.bold.center Технічне завдання\r\n        %p.center\r\n          до договору № \#{contract.number} від \#{locale_date(contract.start_date, \"%d %B %Y\", :ua)}\r\n      %td\r\n        %p.bold.center Specification of requirements\r\n        %p.center\r\n          to contract # \#{contract.number} of \#{locale_date(contract.start_date, \"%B %d, %Y\", :en)}\r\n    %tr\r\n      %td.padding_top_bottom_5\r\n        %p\r\n          Стосовно послуг ІТ Консультанта, \#{person_type_for_locale(person_type, :ua)}\r\n          \#{ua_user_field.full_name},\r\n          на період з \#{locale_date(contract.start_date, \"«%d» %B %Y\", :ua)}р.\r\n          по \#{locale_date(contract.end_date, \"«%d» %B %Y\", :ua)}р. (обидва дні включно).\r\n          З можливістю продовження даного договору на підставах вказаних нижче.\r\n      %td.padding_top_bottom_5\r\n        %p\r\n          As of IT consulting services of \#{person_type_for_locale(person_type, :en)}\r\n          \#{en_user_field.full_name}\r\n          for the period from \#{locale_date(contract.start_date, \"%B %d, %Y\", :en)}\r\n          to \#{locale_date(contract.end_date, \"%B %d, %Y\", :en)} (both days included).\r\n          With the possibility of extending the contract for the reasons listed below.\r\n    %tr\r\n      %td.padding_top_bottom_5\r\n        %p.bold.underline 1. Завдання (задача):\r\n        %p IT консультування: розробка програмного забезпечення.\r\n      %td.padding_top_bottom_5\r\n        %p.bold.underline 1. Task (problem):\r\n        %p IT consulting: software development.\r\n    %tr\r\n      %td.padding_top_bottom_5\r\n        %p.bold.underline 2. Ім’я клієнта:\r\n        %p JetThoughts LLC\r\n      %td.padding_top_bottom_5\r\n        %p.bold.underline 2. Client:\r\n        %p JetThoughts LLC\r\n    %tr\r\n      %td.padding_top_bottom_5\r\n        %p.bold.underline 3. Контрактна цена:\r\n        %p\r\n          Оплата за консультаційні послуги буде розраховуватись згідно кількості наданих консультаційних\r\n          годин. Погоджена ціна буде становити \#{ua_user_field.contract_price} за надані послуги\r\n          в сфері розробки ПЗ.\r\n      %td.padding_top_bottom_5\r\n        %p.bold.underline 3. Contract price:\r\n        %p\r\n          Payment for consulting services will be calculated according to the number of the provided\r\n          consulting hours. Agreed price will be \#{en_user_field.contract_price} for the software\r\n          development services provided.\r\n    %tr\r\n      %td.padding_top_bottom_5\r\n        %p.bold.underline 4. Місцезнаходження:\r\n        %p= \"\#{ua_user_field.location}.\"\r\n      %td.padding_top_bottom_5\r\n        %p.bold.underline 4. Location:\r\n        %p= \"\#{en_user_field.location}.\"\r\n    %tr\r\n      %td.padding_top_bottom_5\r\n        %p.bold.underline 5. Інші умови:\r\n        %p\r\n          Надається можливість продовження даного окремого Договору на необхідний період дотримуючись\r\n          аналогічних умов та строків. Дана можливість може застосовуватись не пізніше ніж за 1 тиждень до\r\n          закінчення цього договору.\r\n      %td.padding_top_bottom_5\r\n        %p.bold.underline 5. Other Conditions:\r\n        %p\r\n          The possibility of the continuation of this particular Contract for the required period following\r\n          similar terms and conditions. This possibility can be used no later than 1 week prior to the\r\n          expiration of this contract.\r\n    %tr\r\n      %td.padding_top_11\r\n        %p.bold Замовник\r\n        %p JetThoughts LLC\r\n        %br\r\n        %p Адрес: 401 E 1st St Suite 1868 - 0039, Sanford FL , 32772\r\n        %p Тел.: +1 760 264 4264\r\n        %br\r\n        %br\r\n        %p Директор_______________________/ Nikitochkin Pavlo\r\n      %td.padding_top_11\r\n        %p.bold The Company\r\n        %p JetThoughts LLC\r\n        %br\r\n        %p Address: 401 E 1st St Suite 1868 - 0039, Sanford FL , 32772\r\n        %p Phone: +1 760 264 4264\r\n        %br\r\n        %br\r\n        %p Director________________________/ Nikitochkin Pavlo\r\n    %tr\r\n      %td.padding_top_11\r\n        %p.bold Виконавець\r\n        %p= \"\#{person_type_for_locale(person_type, :ua)} \#{ua_user_field.full_name}\"\r\n        %br\r\n        %p= \"Адреса: \#{ua_user_field.address}\"\r\n        %br\r\n        %p= \"Ідентифікаційний номер: \#{user.taxpayer_id}\"\r\n        %br\r\n        - if person_type == \"PE\"\r\n          %p= \"Свідоцтво № \#{user.register_number}\"\r\n          %p= \"Від \#{locale_date(user.register_number_start_date, \"«%d» %B %Y\", :ua)}\"\r\n        - else\r\n          %p= \"Паспорт номер: \#{user.passport_number}\"\r\n          %p= \"Виданий \#{ua_user_field.passport_issued_by}\"\r\n        %br\r\n        %p= \"п/р № \#{ua_user_field.c_a_number}\"\r\n        %p= ua_user_field.bank_name\r\n        %p= \"Адреса банку: \#{ua_user_field.bank_address}\"\r\n        %p= \"Bank SWIFT Code \#{user.swift_code}\"\r\n        %p= \"IBAN \#{user.iban_number}\" if user.iban_number.present?\r\n        %br\r\n        %br\r\n        %p\r\n          \#{person_type_for_locale(person_type, :ua)}__________________/\r\n          \#{ua_user_field.name_with_initials}\r\n        %br\r\n      %td.padding_top_11\r\n        %p.bold The Contractor\r\n        %p= \"\#{person_type_for_locale(person_type, :en)} \#{en_user_field.full_name}\"\r\n        %br\r\n        %p= \"Address: \#{en_user_field.address}\"\r\n        %br\r\n        %p= \"Taxpayer ID: \#{user.taxpayer_id}\"\r\n        %br\r\n        - if person_type == \"PE\"\r\n          %p= \"Register № \#{user.register_number}\"\r\n          %p= \"As of \#{locale_date(user.register_number_start_date, \"%B %d, %Y\", :en)}\"\r\n        - else\r\n          %p= \"Passport number: \#{user.passport_number}\"\r\n          %p= \"Issued by \#{en_user_field.passport_issued_by}\"\r\n        %br\r\n        %p= \"c/a № \#{en_user_field.c_a_number}\"\r\n        %p= en_user_field.bank_name\r\n        %p= \"Bank Address: \#{ua_user_field.bank_address}\"\r\n        %p= \"Bank SWIFT Code \#{user.swift_code}\"\r\n        %p= \"IBAN \#{user.iban_number}\" if user.iban_number.present?\r\n        %br\r\n        %br\r\n        %p\r\n          \#{person_type_for_locale(person_type, :en)}__________________/\r\n          \#{en_user_field.short_name}\r\n        %br\r\n"
    end
  end
end