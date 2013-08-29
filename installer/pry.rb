if install?('pry')
  install_gem 'pry-rails'
  install_gem 'pry-doc'
  install_gem 'pry-debugger'
  install_gem 'hirb' if install?('hirb')
end
