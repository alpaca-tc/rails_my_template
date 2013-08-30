module Helpers
  module OmniAuth
    extend Base

    def create_config
      create_file 'config/initializers/omniauth.rb', <<-DATA
Rails.application.config.middleware.use OmniAuth::Builder do
  config = Rails.configuration.config
end
      DATA
    end

    def outh_config(text)
      inject_into_file omniauth, after: "Rails.configuration.config\n" do
        text.optimize(2)
      end
    end

    def omniauth
      'config/initializers/omniauth.rb'
    end
  end
end
