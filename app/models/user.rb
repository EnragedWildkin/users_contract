class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }

  has_one :en_user_field, -> { where(language: 'en')}, class_name: 'UserField', inverse_of: :user
  has_one :ua_user_field, -> { where(language: 'ua')}, class_name: 'UserField', inverse_of: :user
  has_one :ru_user_field, -> { where(language: 'ru')}, class_name: 'UserField', inverse_of: :user

  accepts_nested_attributes_for :en_user_field
  accepts_nested_attributes_for :ua_user_field
  accepts_nested_attributes_for :ru_user_field

  belongs_to :role
  has_many :contracts
  before_create :set_default_role

  def name
    en_user_field.last_name + " " + en_user_field.first_name
  end

  def admin?
    role.name == "admin"
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end
end
