
desc "Reindex search in solr"
task :custom_name do
on roles(:app), in: :sequence, wait: 5 do
    within release_path do
        with rails_env: :production do
          execute :rake, "sunspot:reindex", "RAILS_ENV=production"
        end
    end
  end
end
