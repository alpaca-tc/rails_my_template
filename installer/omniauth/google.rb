if install?('omniauth-google')
  install_gem 'omniauth-google'
  @omniauth.outh_config <<-CODE
  provider :google, config[:GOOGLE_CLIENT_KEY], config[:GOOGLE_CLIENT_SECRET]
  CODE
end
