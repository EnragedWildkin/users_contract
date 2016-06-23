module SignInHelper
  def login(user)
    login_user(users(user))
  end
end
