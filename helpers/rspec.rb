module Helpers
  module Rspec
    extend Base

    def append_config(text)
      inject_into_file path, after: "RSpec.configure do |config|\n" do
        text.optimize(2, true)
      end
    end

    def head(text)
      inject_into_file path, after: %q!ENV["RAILS_ENV"] ||= 'test'! do
        text.optimize(0, true)
      end
    end

    def remove_config(pattern)
      gsub_file path, pattern, 'repracement' 
    end

    def path
      'spec/spec_helper.rb'
    end
  end
end
