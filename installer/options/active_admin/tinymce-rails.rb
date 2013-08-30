if false 
  # install?('tinymce-rails')
  install_gem 'tinymce-rails'

  create_file 'config/tinymce.yml', <<-DATA
theme_advanced_toolbar_location: top
theme_advanced_toolbar_align: left
theme_advanced_statusbar_location: bottom
theme_advanced_buttons3_add:
  - tablecontrols
  - fullscreen
plugins:
  - table
  - fullscreen
  DATA

  append_to_file 'app/assets/javascripts/active_admin.js.coffee', before: '#= require active_admin/base' do
    '#= require tinymce-jquery'.optimize
  end
end

