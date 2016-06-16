class UserField < ActiveRecord::Base
  belongs_to :user, inverse_of: :en_user_field

  def short_name
    [last_name, first_name].join(' ')
  end

  def full_name
    [last_name, first_name, middle_name].join(' ')
  end

  def name_with_initials
    last_name + " " + [first_name[0], middle_name[0]].join('.')
  end
end
