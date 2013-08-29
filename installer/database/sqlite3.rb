if !@installed_database && install?('sqlite3')
  @installed_database = true
  install_gem 'sqlite3'

  create_file 'config/database.yml.default', %Q!
<%
# -- config --
db_name = '#{@database_name}'
# --  end  --
%>
common: &common
  adapter: sqlite3
  pool: 5
  timeout: 5000

development: 
  << : *common
  database: db/<%= db_name %>_development.sqlite3

test:
  << : *common
  database: db/<%= db_name %>_test.sqlite3

production:
  << : *common
  database: db/<%= db_name %>_production.sqlite3
!
end
