class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :draft
  attr_accessor :pdf

  validates :number, presence: { message: "Contract number can't be blank" }
end
