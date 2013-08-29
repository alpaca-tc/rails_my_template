require 'pry'
$: << File.dirname(__FILE__)
@root_path = '/Users/alpaca/project/my_rails_template'
@installer_path = "#{@root_path}/installer"
@target_path = @destination_stack.first

Dir.chdir(@root_path) do
  # Extends Thor syntax
  Dir['./thor/*.rb'].each { |f| require f }
  # Loads Helpers
  Dir['./helpers/*.rb'].each { |f| require f }
  # Extends String
  Dir['./core_ext/*.rb'].each { |f| require f }
end

@debug = true
@config = Helpers::Config.setup(self)
@installed = []
@after_stack = []

apply "#{@root_path}/before_initialize.rb"
apply_dir('installer/*.rb')
apply "#{@root_path}/after_initialize.rb"
apply "#{@root_path}/git.rb"
