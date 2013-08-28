@rspec = Helpers::Rspec.setup(self)

gem_group :test do
  install_gem 'rspec-rails', '>= 2.12'
  install_gem 'database_cleaner', '>= 1.1.1'
end

generate 'rspec:install'
@config.generator <<-CODE
  generator.test_framework :rspec
CODE

if install?('factory_girl_rails')
  apply "#{@template_path}/rspec/factory_girl.rb"
end
