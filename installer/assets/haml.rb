if install?('haml')
  install_gem 'haml'
  install_gem 'haml-rails'

  # @config.generator <<-CODE
  #   generator.template_engine :haml
  # CODE

  create_file "config/initializers/haml.rb" do
    <<-HAML.gsub(/^\s*/, '')
    # Haml::Template.options[:attr_wrapper] = '\"'
    # Haml::Template.options[:format] = :xhtml
    # Sass::Plugin.options[:style] = :expanded
    HAML
  end

  inside 'app/views/layouts' do
    remove_file 'application.html.erb'
    get "#{@root_path}/resources/app/views/layouts/application.html.haml", 'application.html.haml'
  end
end
