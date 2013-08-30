if install?('omniauth-twitter')
  install_gem 'omniauth-twitter'
  @omniauth.outh_config <<-CODE
  provider :twitter, config[:TWITTER_CONSUMER_KEY], config[:TWITTER_CONSUMER_SECRET]
  CODE
end
