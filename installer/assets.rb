install_gem 'sass-rails', '~> 4.0.0'
install_gem 'coffee-rails', '~> 4.0.0'
install_gem 'uglifier', '>= 1.3.0'
# install_gem 'jquery-rails'
install_gem 'jbuilder', '~> 1.2'
install_gem 'turbolinks'
install_gem 'capistrano', group: :development

apply_dir 'installer/assets/*.rb'
