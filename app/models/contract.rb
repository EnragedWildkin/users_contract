class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :draft
  belongs_to :person_type

  validates :number, presence: { message: "Contract number can't be blank" }

  validates :start_date, presence: { message: "Contract start date can't be blank" }
  validate :date_validation

  has_one :en_contract_field, -> { where(language: 'en')}, class_name: 'ContractField', inverse_of: :contract
  has_one :ua_contract_field, -> { where(language: 'ua')}, class_name: 'ContractField', inverse_of: :contract

  accepts_nested_attributes_for :en_contract_field
  accepts_nested_attributes_for :ua_contract_field

  private
  def date_valid?
    if start_date > end_date
      errors[:end_date] << "Contract's end date can't be greater than start date"
      return false
    else
      return true
    end
  end

  def date_validation
    date_valid? if start_date? && end_date?
  end
end
