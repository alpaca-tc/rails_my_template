def run(command)
  puts command
  `#{command}`
end

run 'cp config/config.yml.default config/config.yml'
run 'cp config/database.yml.default config/database.yml'
