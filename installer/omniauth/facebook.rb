if install?('omniauth-facebook')
  install_gem 'omniauth-facebook'
  @omniauth.outh_config <<-CODE
  provider :facebook, config[:FACEBOOK_APP_KEY], config[:FACEBOOK_APP_SECRET]
  CODE
end
