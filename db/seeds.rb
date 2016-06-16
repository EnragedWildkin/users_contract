[
  "SOR-LLC-draft-Ukraine",
  "SOR-LLC-draft_Russia",
  "NDA-LLC-draft-Ukraine",
  "NDA-LLC-draft_Russia",
  "Consulting-Services-draft"
].each { |name| Draft.find_or_create_by({ name: name }) }

["registered", "admin"].each do |role|
  Role.find_or_create_by({ name: role })
end

["PE", "Physical person"].each do |name|
  PersonType.find_or_create_by({ name: name })
end

admin = User.find_or_create_by(email: "admin@email.com") do |user|
  user.password = "12345admin"
  user.password_confirmation = "12345admin"
  user.role = Role.find_by_name("admin")
end

user1 = User.find_or_create_by(email: "user1@email.com") do |user|
  user.password = "12345user"
  user.password_confirmation = "12345user"
  user.taxpayer_id = "99999999"
  user.register_number = "9999999"
  user.register_number_start_date = "2001-01-01"
  user.swift_code = "MMMMMM"
  user.iban_number = "9999999"
  user.bank_code = "325321"
  user.passport_number = "000"
  user.intermediary_bank_name = "JP MORGAN CHASE BANK"
  user.intermediary_bank_swift_code = "MMMMMM"
end

user1.en_user_field = UserField.find_or_create_by(
  first_name: "Ivan",
  last_name: "Ivanov",
  middle_name: "Ivanovych",
  contract_price: "$10.00/h",
  location: "remotely (Odessa, Ukraine)",
  address: "88888, Some Str., Lviv, Ukraine",
  passport_issued_by: "the Department of the Federal Migration Service of Russia in the Vologda region in Cherepovets, 06.08.2008",
  c_a_number: "999999999999 in US Dollars",
  bank_name: "JSC “PrivatBank”",
  bank_address: "8888, Some Str., Lviv, Ukraine",
  language: "en"
)

user1.ua_user_field = UserField.find_or_create_by(
  first_name: "Іван",
  last_name: "Іванов",
  middle_name: "Іванович",
  contract_price: "$10.00/год",
  location: "віддалено (Одеса, Україна)",
  address: "88888, Якась вул, Львів, Україна",
  passport_issued_by: "Київським РВ ГУ МВС України по Харківській області в м. Харкові, 19.06.2007",
  c_a_number: "999999999999 в доларах США",
  bank_name: "ПАТ КБ “ПриватБанк”",
  bank_address: "88888, Якась вул, Львів, Україна",
  language: "ua"
)

user1.ru_user_field = UserField.find_or_create_by(
  first_name: "Иван",
  last_name: "Иванов",
  middle_name: "Иванович",
  contract_price: "$10.00/ч",
  location: "удаленно (Москва, Россия)",
  address: "88888, ул. Зеленая, Львов, Украина",
  passport_issued_by: "отделом УФМС России по Вологодской области в городе Череповце, 06.08.2008",
  c_a_number: "999999999999 в долларах США",
  bank_name: "ПАТ КБ “ПриватБанк”",
  bank_address: "888888, ул. Городоцкая, 20, Львов, Украина",
  language: "ru"
)

user2 = User.find_or_create_by(email: "user2@email.com") do |user|
  user.password = "12345user"
  user.password_confirmation = "12345user"
  user.taxpayer_id = "99999999"
  user.register_number = "9999999"
  user.register_number_start_date = "2001-01-01"
  user.swift_code = "MMMMMM"
  user.iban_number = "9999999"
  user.bank_code = "325321"
  user.passport_number = "000"
end

user2.en_user_field = UserField.find_or_create_by(
  first_name: "Petro",
  last_name: "Petrov",
  middle_name: "Petrovych",
  contract_price: "$10.00/h",
  location: "remotely (Odessa, Ukraine)",
  address: "88888, Some Str., Lviv, Ukraine",
  passport_issued_by: "the Department of the Federal Migration Service of Russia in the Vologda region in Cherepovets, 06.08.2008",
  c_a_number: "999999999999 in US Dollars",
  bank_name: "JSC “PrivatBank”",
  bank_address: "8888, Some Str., Lviv, Ukraine",
  language: "en"
)

user2.ua_user_field = UserField.find_or_create_by(
  first_name: "Петро",
  last_name: "Петров",
  middle_name: "Петрович",
  contract_price: "$10.00/год",
  location: "віддалено (Одеса, Україна)",
  address: "88888, Якась вул, Львів, Україна",
  passport_issued_by: "Київським РВ ГУ МВС України по Харківській області в м. Харкові, 19.06.2007",
  c_a_number: "999999999999 в доларах США",
  bank_name: "ПАТ КБ “ПриватБанк”",
  bank_address: "88888, Якась вул, Львів, Україна",
  language: "ua"
)

user2.ru_user_field = UserField.find_or_create_by(
  first_name: "Петр",
  last_name: "Петров",
  middle_name: "Петрович",
  contract_price: "$10.00/ч",
  location: "удаленно (Москва, Россия)",
  address: "88888, ул. Зеленая, Львов, Украина",
  passport_issued_by: "отделом УФМС России по Вологодской области в городе Череповце, 06.08.2008",
  c_a_number: "999999999999 в долларах США",
  bank_name: "ПАТ КБ “ПриватБанк”",
  bank_address: "888888, ул. Городоцкая, 20, Львов, Украина",
  language: "ru"
)
