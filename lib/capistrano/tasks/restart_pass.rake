task :restart_pass do
  on roles(:app), in: :sequence, wait: 5 do
      within release_path do
          with rails_env: :production do
            #execute "cd '#{release_path}'";
            #invoke "passenger:restart"
            execute "/home/localadmin/.rvm/bin/rvmsudo", "passenger-config", "restart-app", "#{deploy_to} --ignore-app-not-running";
          end
      end
    end
end
