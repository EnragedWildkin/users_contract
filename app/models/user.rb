class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessor :skip_login_fields
  before_validation :skip_unique_validation

  validates :password, length: { minimum: 3 }, if: -> { new_record? && !skip_login_fields || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? && !skip_login_fields || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? && !skip_login_fields || changes[:crypted_password] }

  validates :email,
    allow_blank: true,
    presence: { message: 'Your email is used to save your greeting.' },
    if: -> { email.blank? && skip_login_fields }

  validates :email,
    email_format: { message: 'has invalid format' },
    uniqueness: true,
    unless: -> {  email.blank? && skip_login_fields }

  has_one :en_user_field, -> { where(language: 'en')}, class_name: 'UserField', inverse_of: :user
  has_one :ua_user_field, -> { where(language: 'ua')}, class_name: 'UserField', inverse_of: :user
  has_one :ru_user_field, -> { where(language: 'ru')}, class_name: 'UserField', inverse_of: :user

  accepts_nested_attributes_for :en_user_field
  accepts_nested_attributes_for :ua_user_field
  accepts_nested_attributes_for :ru_user_field

  belongs_to :role
  has_many :contracts
  before_create :set_default_role

  def admin?
    role.name == "admin"
  end

  def skip_email_and_password_validation
    self.skip_login_fields = true
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end

  def skip_unique_validation
    self.email = nil if email.blank?
  end
end
