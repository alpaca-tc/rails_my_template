%w[README doc/ public/index.html public/images/rails.png test/].each do |file|
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

    config.generators do |generator| 
    end
  CODE
end
