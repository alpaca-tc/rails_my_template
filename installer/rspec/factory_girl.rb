if install?('factory_girl_rails')
  install_gem 'factory_girl_rails', :group => :test

  @rspec.head "require 'factory_girl'"

  gsub_file(
    @rspec.path, 
    'config.fixture_path = "#{::Rails.root}/spec/fixtures"', 
    'config.fixture_path = "#{::Rails.root}/spec/factories"'
  )

  @config.generator <<-CODE
  generator.fixture_replacement :factory_girl, :dir => 'spec/factories'
  CODE
end
