module Helpers
  module Config
    extend Base

    def config(text)
      inject_into_file path, :before => "config.generators do |generator|" do
        text.optimize(0, true)
      end
    end

    def generator(text)
      inject_into_file path, :after => "config.generators do |generator|" do
        text.optimize(0, true)
      end
    end

    def path
      'config/application.rb'
    end
  end
end
