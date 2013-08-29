%w[
config/config.yml 
config/database.yml
public/favicon.ico
public/404.html
public/500.html
public/422.html
public/robots.txt
README.rdoc
].each { |f| remove_file(f) }

@after_stack.each { |cmd| cmd.call }
