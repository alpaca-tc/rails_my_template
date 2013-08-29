if install?('sitemap_generator')
  inside @target_path do
    run 'rake sitemap:install'
  end
end
