if install?('guard')
  gem_group :development, :test do
    install_gem 'guard'
    install_gem 'guard-livereload'
    install_gem 'guard-rspec'
    install_gem 'guard-spork'
    inside @target_path do
      run 'spork --bootstrap'
    end
    install_gem 'terminal-notifier-guard'
  end
end
