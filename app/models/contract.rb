class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :draft
  belongs_to :person_type

  validates :number, presence: { message: "Contract number can't be blank" }

  has_one :en_contract_field, -> { where(language: 'en')}, class_name: 'ContractField', inverse_of: :contract
  has_one :ua_contract_field, -> { where(language: 'ua')}, class_name: 'ContractField', inverse_of: :contract

  accepts_nested_attributes_for :en_contract_field
  accepts_nested_attributes_for :ua_contract_field

end
