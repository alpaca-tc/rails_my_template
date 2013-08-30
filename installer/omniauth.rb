if install?('omniauth')
  @omniauth = Helpers::OmniAuth.setup(self)

  install_gem 'omniauth'
  @omniauth.create_config

  generate :model, 'oauth_token', 'uid:string provider:string'

  remove_file 'spec/factories/oauth_tokens.rb'
  create_file 'spec/factories/oauth_tokens.rb', File.open("#{@root_path}/installer/omniauth/resources/oauth_tokens.rb").read

  insert_into_file 'app/models/oauth_token.rb', after: "class OauthToken < ActiveRecord::Base\n" do
    <<-CODE
    def self.find_or_create_with_omniauth!(auth)
      find_or_create_by!(uid: auth['uid'], provider: auth['provider'])
    end

    validates :uid, presence: true
    validates :provider, presence: true
    CODE
  end

  remove_file 'spec/models/oauth_token_spec.rb'
  create_file 'spec/models/oauth_token_spec.rb', File.open("#{@root_path}/installer/omniauth/resources/oauth_token_spec.rb").read 

  inside @target_path do
    run 'rake db:migrate'
  end

  @config.append_routes <<-CODE
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  CODE

  create_file 'app/controllers/sessions_controller.rb', File.open("#{@root_path}/installer/omniauth/resources/sessions_controller.rb").read

  append_to_file 'app/controllers/application_controller.rb', after: "protect_from_forgery with: :exception\n" do
    <<-CODE
    helper_method :current_user

    def current_user
      @current_user ||= OauthToken.find(session[:oauth_token_id]) if session[:oauth_token_id]
    end
    CODE
  end

  apply_dir 'installer/omniauth/*.rb'
end
