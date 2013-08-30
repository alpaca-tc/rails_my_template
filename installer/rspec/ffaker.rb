if install?('ffaker')
  # TODO install_gem 'ffaker_custom', github: 'alpaca-tc/ffaker', require: false, group: :test
  gem 'ffaker_custom', github: 'alpaca-tc/ffaker', require: false, group: :test
  @rspec.head <<-CODE
  require 'faker'
  CODE

  inside @target_path do
    run 'bundle'
  end
end
