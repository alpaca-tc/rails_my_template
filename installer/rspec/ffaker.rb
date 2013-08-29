if install?('ffaker')
  install_gem 'ffaker', group: :test
  @rspec.head <<-CODE
  require 'ffaker'
  CODE
end
