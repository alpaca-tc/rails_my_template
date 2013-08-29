%w[
README 
doc/ 
public/index.html 
public/images/rails.png 
test/
config/database.yml
.gitignore
].each do |file|
  remove_file file
end

gsub_file 'Gemfile', /.*/, ''
gsub_file 'Gemfile', /\n+/, ''
install_gem 'rails', '4.0.0'

# Changing Timezone to Tokyo
inject_into_file 'config/application.rb', :after => "class Application < Rails::Application\n" do
  <<-CODE
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.config = YAML.load_file("\#{Rails.root}/config/config.yml")[Rails.env].symbolize_keys

    config.generators do |generator|
    end
  CODE
end

Dir["#{@root_path}/resources/**/*", "#{@root_path}/resources/**/.*"].each do |f|
  relative_path_from_root = f.gsub("#{@root_path}/resources/", '')

  if File.directory?(f) 
    empty_directory relative_path_from_root unless File.exists?(relative_path_from_root)
  else
    copy_file f, relative_path_from_root
  end
end
