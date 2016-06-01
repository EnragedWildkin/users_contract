class UserField < ActiveRecord::Base
  belongs_to :user, inverse_of: :en_user_field
end
