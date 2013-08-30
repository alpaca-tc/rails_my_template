if install?('omniauth-google')
  install_gem 'omniauth-google'
  @omniauth.outh_config <<-CODE
  provider :google, config[:GOOGLE_CLIENT_ID], config[:GOOGLE_CLIENT_SECRET]
  CODE
end
