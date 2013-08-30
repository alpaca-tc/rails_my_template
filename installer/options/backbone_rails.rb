if install?('backbone-on-rails')
  install_gem 'backbone-on-rails'
  inside @target_path do
    generate 'backbone:install'
  end
elsif install?('backbone-rails')
  install_gem 'backbone-rails'
end
