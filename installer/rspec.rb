@rspec = Helpers::Rspec.setup(self)

gem_group :test do
  install_gem 'rspec-rails', '>= 2.12'
  install_gem 'database_cleaner', '>= 1.1.1'
end

generate 'rspec:install'
@config.generator <<-CODE
  generator.test_framework :rspec
CODE

apply_dir 'installer/rspec/*.rb'
