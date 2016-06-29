class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :draft
  belongs_to :person_type
  validate   :sor_llc_draft_ukraine if -> { draft && draft.name.downcase == 'sor-llc-draft-ukraine' }

  validates :number, presence: { message: "Contract number can't be blank" }

  has_one :en_contract_field, -> { where(language: 'en')}, class_name: 'ContractField', inverse_of: :contract
  has_one :ua_contract_field, -> { where(language: 'ua')}, class_name: 'ContractField', inverse_of: :contract

  accepts_nested_attributes_for :en_contract_field
  accepts_nested_attributes_for :ua_contract_field

  def sor_llc_draft_ukraine
    user_field_array = [
      user.ua_user_field.method(:first_name),
      user.ua_user_field.method(:middle_name),
      user.ua_user_field.method(:last_name),
      user.ua_user_field.method(:contract_price),
      user.ua_user_field.method(:location),
      user.ua_user_field.method(:address),
      user.ua_user_field.method(:passport_issued_by),
      user.ua_user_field.method(:c_a_number),
      user.ua_user_field.method(:bank_name),
      user.ua_user_field.method(:bank_address),

      user.en_user_field.method(:first_name),
      user.en_user_field.method(:middle_name),
      user.en_user_field.method(:last_name),
      user.en_user_field.method(:contract_price),
      user.en_user_field.method(:location),
      user.en_user_field.method(:address),
      user.en_user_field.method(:passport_issued_by),
      user.en_user_field.method(:c_a_number),
      user.en_user_field.method(:bank_name),
      user.en_user_field.method(:bank_address),

      user.method(:taxpayer_id),
      user.method(:register_number),
      user.method(:register_number_start_date),
      user.method(:passport_number),
      user.method(:swift_code),
      user.method(:iban_number),
    ]

    user_field_array.each do |field|
      errors.add(field.name, "Users #{field.name.to_s} can't be blank") if field.call.blank?
    end
  end
end
