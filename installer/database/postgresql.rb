if !@installed_database && install?('pg')
  @installed_database = true
  install_gem 'postgresql'

  create_file 'config/database.yml.default', %Q!
<%
# -- config --
db_name = '#{@db_name}'
# --  end  --
%>

common: &common
  adapter: postgresql
  encoding: unicode
  pool: 5
  username: 
  password:
  host: localhost
  port: 5432

development:
  << : *common
  database: << : <%= db_name %>_development
 
# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  << : * &common
  database: << : <%= db_name %>_test
 
production:
  << : * &common
  database: << : <%= db_name %>_production
  username: 
  password:
!
end
