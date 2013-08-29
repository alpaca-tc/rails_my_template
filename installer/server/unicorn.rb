if !@installed_server && install?('unicorn')
  @installed_server = true
  install_gem 'unicorn'

  create_file 'config/unicorn.rb', %q[
rails_root = File.expand_path(__FILE__ + "/../../")

worker_processes 2
working_directory rails_root # available in 0.94.0+
preload_app true # Load rails before forking workers for better worker spawn time
timeout 240 # Restart workes hangin' out for more than 240 secs

# listen "#{rails_root}/tmp/unicorn.sock", backlog: 64
listen "#{rails_root}/tmp/unicorn.sock"
pid "#{rails_root}/tmp/unicorn.pid"

stderr_path "#{rails_root}/log/unicorn.stderr.log"
stdout_path "#{rails_root}/log/unicorn.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
]
end
