unless Rails.env.production?
  OAuth2Me.redirect_url = 'http://www.jetthoughts.com/oauth2-me/redirect'

  if Rails.env.development?
    OAuth2Me.redirect_url = 'http://localhost:3000/auth/google_oauth2/callback'
  end
end
