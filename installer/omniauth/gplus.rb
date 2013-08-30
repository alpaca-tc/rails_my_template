if install?('omniauth-gplus')
  install_gem 'omniauth-gplus'
  @omniauth.outh_config <<-CODE
  provider :gplus, config[:GPLUS_CLIENT_ID], config[:GPLUS_CLIENT_SECRET]
  CODE
end
