if install?('activeadmin')
  @active_admin = Helpers::ActiveAdmin.setup(self)

  # TODO Replace gems to new_settings when merging 'rais4' of the branch to active_admin.
  install_gem 'formtastic', github: 'justinfrench/formtastic'
  install_gem 'bourbon'
  install_gem 'activerecord', '~> 4.0.0'
  install_gem 'kaminari', '~> 0.14.1'
  install_gem 'inherited_resources', github: 'josevalim/inherited_resources'
  # gem 'ransack',             github: 'ernie/ransack',         branch: 'rails-4'
  install_gem 'jquery-ui-rails', '~>4.0.4'
  install_gem 'arbre', '1.0.1'
  install_gem 'activeadmin', github: 'gregbell/active_admin', branch: 'rails4'
  inside @destination_stack.first do
    run 'bundle install'
  end

  # Downgrade jquey-rails 
  # You can check out http://stackoverflow.com/questions/16426398/active-admin-install-with-rails-4
  # install_gem 'jquery-rails', '2.3.0'
  generate 'active_admin:install'

  @active_admin.append_config <<-CODE
  config.allow_comments = false
  config.show_comments_in_menu = false
  CODE

  apply_dir 'installer/options/active_admin/*.rb'
end
