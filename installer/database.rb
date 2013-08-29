@db_name = self.app_name
apply_dir 'installer/database/*.rb'

db_path = "#{@target_path}/config/database.yml.default"
copy_file db_path, "#{@target_path}/config/database.yml" if File.exists?(db_path)

inside @target_path do
  run 'rake db:drop' rescue nil if @debug || yes?('Drop databases?', :yellow)
  run 'rake db:create'
  run 'rake db:migrate'
end
