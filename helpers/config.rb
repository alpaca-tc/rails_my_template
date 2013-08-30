module Helpers
  module Config
    extend Base
    CHAR=[*('a'..'z'), *('A'..'Z'), *('0'..'9')].freeze

    def config(text)
      inject_into_file target_path, :before => /do \|generator\|/ do
        text.optimize(4, true)
      end
    end

    def generator(text)
      inject_into_file target_path, :after => /do \|generator\|\n/ do
        text.optimize(6)
      end
    end

    def append_routes(text)
      inject_into_file 'config/routes.rb', :after => "Application.routes.draw do\n" do
        text.optimize(2)
      end
    end

    def path
      'config/application.rb'
    end

    def target_path
      'config/application.rb'
    end

    def initializers_path
      'config/initializers'
    end

    def hash_key(length)
      Array.new(16) { CHAR[rand(CHAR.length)] }.join
    end
  end
end
