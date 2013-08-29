module Helpers
  module Config
    extend Base

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

    def path
      'config/application.rb'
    end

    def target_path
      'config/application.rb'
    end

    def initializers_path
      'config/initializers'
    end
  end
end
