require 'pry'
$: << File.dirname(__FILE__)
@template_path = '/Users/alpaca/project/my_rails_template'

Dir.chdir(@template_path) do
  # Extends Thor syntax
  Dir['./thor/*.rb'].each { |f| require f }
  # Loads Helpers
  Dir['./helpers/*.rb'].each { |f| require f }
  # Extends String
  Dir['./core_ext/*.rb'].each { |f| require f }
end

@config = Helpers::Config.setup(self)

%w[
  initialize
  rspec
  database
  asset_gems
].each { |path| apply "#{@template_path}/#{path.gsub(/^\s*/, '')}.rb" }

run 'bundle'
