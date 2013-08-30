if install?('omniauth-google-oauth2')
  install_gem 'omniauth-google-oauth2'
  @omniauth.outh_config <<-CODE
  provider :google_oauth2, config[:GOOGLE_CLIENT_ID], config[:GOOGLE_CLIENT_SECRET]
  CODE
end
