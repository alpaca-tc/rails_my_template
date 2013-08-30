if install?('capybara')
  install_gem 'capybara'

  @rspec.head <<-CODE
  require 'capybara/rspec'
  CODE

  if install?('capybara-webkit')
    install_gem 'capybara-webkit'
    @rspec.head <<-CODE
    require 'capybara-webkit'
    Capybara.javascript_driver = :webkit
    # Capybara.default_driver = :selenium
    CODE
  end
end
