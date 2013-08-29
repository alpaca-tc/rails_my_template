if install?('simplecov')
  install_gem 'simplecov', :require => false, :group => :test
  @rspec.head <<-CODE
require 'simplecov'
SimpleCov.start
  CODE
end
