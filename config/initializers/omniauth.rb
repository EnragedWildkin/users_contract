strategy_class = OmniAuth::Strategies::GoogleOauth2
OAuth2Me.omniauth_strategy_updater.setup_omniauth_strategy(strategy_class)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET"],
            access_type: 'offline',
            scope:       'userinfo.email userinfo.profile',
            prompt:      'select_account',
            skip_jwt: true
end
