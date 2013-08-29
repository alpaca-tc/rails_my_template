if install?('better_errors')
  gem_group :development do
    install_gem 'better_errors' 
    install_gem 'binding_of_caller'
  end
end
