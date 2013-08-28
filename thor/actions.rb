def install_gem(gem_name, *args)
  gem(gem_name.dup, *args)
  version = args.select { |val| val.is_a?(String) && val =~ /^(>=\s+|~>\s+)[0-9.]+$/ }
  version = [version, nil].flatten[0]

  if Gem::Specification.find_all_by_name(gem_name).empty?
    version = "-v '#{version}'" if version
    run "gem install #{gem_name} #{version} --no-rdoc --no-ri"
  else
    say("Found #{gem_name} gem, skipping installation", :cyan)
  end
end

def install?(gem_name)
  yes?("Install #{gem_name}?", :yellow)
end
