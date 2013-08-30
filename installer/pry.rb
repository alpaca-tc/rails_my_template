if install?('pry')
  gem_group :development, :test do
    install_gem 'pry-rails'
    install_gem 'pry-doc'
    install_gem 'pry-debugger'
    install_gem 'hirb' if install?('hirb')
  end
end
