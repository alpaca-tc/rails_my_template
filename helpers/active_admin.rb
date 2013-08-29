module Helpers
  module ActiveAdmin
    extend Base

    def append_config(text)
      inject_into_file path, after: "ActiveAdmin.setup do |config|" do
        text.optimize(2, true)
      end
    end

    def path
      'config/initializers/active_admin.rb'
    end
  end
end
