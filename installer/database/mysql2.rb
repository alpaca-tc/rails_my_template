if !@installed_database && install?('mysql2')
  @installed_database = true
  install_gem 'mysql2'

  create_file 'config/database.yml.default', %Q!
<%
# -- config --
db_name = '#{@db_name}'
encoding = 'utf8'
# --  end  --

socket = %w[
  /tmp/mysqld.sock
  /tmp/mysql.sock
  /var/run/mysqld/mysqld.sock
  /var/lib/mysql/mysql.sock
  /opt/local/var/run/mysql5/mysqld.sock
].detect { |socket| File.exist?(socket) }
%>

common: &common
  adapter: mysql2
  encoding: <%= encoding %>
  reconnect: false
  pool: 5
  socket: <%= socket %>
  timeout: 5000
  username: root
  password:

development:
  <<: *common
  database: <%= db_name %>_development

test:
  <<: *common
  database: <%= db_name %>_test

production:
  <<: *common
  database:  <%= db_name %>_production
  username: root
  password:
!
end
