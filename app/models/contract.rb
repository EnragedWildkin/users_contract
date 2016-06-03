class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :draft
  attr_accessor :pdf
end
