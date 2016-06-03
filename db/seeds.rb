["SOR-LLC-draft-Ukraine", "SOR-LLC-draft_Russia", "NDA-LLC-draft-Ukraine", "NDA-LLC-draft_Russia"].each do |name|
  Draft.find_or_create_by({ name: name })
end

["registered", "admin"].each do |role|
  Role.find_or_create_by({ name: role })
end

admin = User.create!(
  email: "admin@email.com",
  password: "12345admin",
  password_confirmation: "12345admin",
  role: Role.find_by_name("admin")
)

user1 = User.create!(
  email: "user1@email.com",
  password: "12345user",
  password_confirmation: "12345user",
  taxpayer_id: "99999999",
  register_number: "9999999",
  register_number_start_date: "2001-01-01",
  swift_code: "MMMMMM",
  iban_number: "9999999",
  bank_code: "325321"
)

user1.en_user_field = UserField.create!(
  first_name: "Ivan",
  last_name: "Ivanov",
  middle_name: "Ivanovych",
  contract_price: "$10.00/h",
  location: "remotely (Odessa, Ukraine)",
  address: "88888, Some Str., Lviv, Ukraine",
  c_a_number: "999999999999 in US Dollars",
  bank_name: "JSC “PrivatBank”",
  bank_address: "8888, Some Str., Lviv, Ukraine",
  language: "en"
)

user1.ua_user_field = UserField.create!(
  first_name: "Іван",
  last_name: "Іванов",
  middle_name: "Іванович",
  contract_price: "$10.00/год",
  location: "віддалено (Одеса, Україна)",
  address: "88888, Якась вул, Львів, Україна",
  c_a_number: "999999999999 в доларах США",
  bank_name: "ПАТ КБ “ПриватБанк”",
  bank_address: "88888, Якась вул, Львів, Україна",
  language: "ua"
)

user1.ru_user_field = UserField.create!(
  first_name: "Иван",
  last_name: "Иванов",
  middle_name: "Иванович",
  contract_price: "$10.00/ч",
  location: "удаленно (Москва, Россия)",
  address: "88888, ул. Зеленая, Львов, Украина",
  c_a_number: "999999999999 в долларах США",
  bank_name: "ПАТ КБ “ПриватБанк”",
  bank_address: "888888, ул. Городоцкая, 20, Львов, Украина",
  language: "ru"
)

user2 = User.create!(
  email: "user2@email.com",
  password: "12345user",
  password_confirmation: "12345user",
  taxpayer_id: "99999999",
  register_number: "9999999",
  register_number_start_date: "2001-01-01",
  swift_code: "MMMMMM",
  iban_number: "9999999",
  bank_code: "325321"
)

user2.en_user_field = UserField.create!(
  first_name: "Petro",
  last_name: "Petrov",
  middle_name: "Petrovych",
  contract_price: "$10.00/h",
  location: "remotely (Odessa, Ukraine)",
  address: "88888, Some Str., Lviv, Ukraine",
  c_a_number: "999999999999 in US Dollars",
  bank_name: "JSC “PrivatBank”",
  bank_address: "8888, Some Str., Lviv, Ukraine",
  language: "en"
)

user2.ua_user_field = UserField.create!(
  first_name: "Петро",
  last_name: "Петров",
  middle_name: "Петрович",
  contract_price: "$10.00/год",
  location: "віддалено (Одеса, Україна)",
  address: "88888, Якась вул, Львів, Україна",
  c_a_number: "999999999999 в доларах США",
  bank_name: "ПАТ КБ “ПриватБанк”",
  bank_address: "88888, Якась вул, Львів, Україна",
  language: "ua"
)

user2.ru_user_field = UserField.create!(
  first_name: "Петр",
  last_name: "Петров",
  middle_name: "Петрович",
  contract_price: "$10.00/ч",
  location: "удаленно (Москва, Россия)",
  address: "88888, ул. Зеленая, Львов, Украина",
  c_a_number: "999999999999 в долларах США",
  bank_name: "ПАТ КБ “ПриватБанк”",
  bank_address: "888888, ул. Городоцкая, 20, Львов, Украина",
  language: "ru"
)
