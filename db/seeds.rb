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
