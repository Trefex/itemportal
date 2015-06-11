# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'trains'
set :repo_url, 'https://github.com/Trefex/trainsportal.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/localadmin/webapps/trains'

# Default value for :scm is :git
set :scm, :git

#set :user, "localadmin"

#set :use_sudo, false

#set :rails_env, "production"

#set :deploy_via, :copy

#set :ssh_options, { :forward_agent => true, :port => 8022 }

set :keep_releases, 10


#default_run_options[:pty] = true

#server "woofex.net", :app, :web, :db, :primary => true

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
#set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'db/production.sqlite3')

set :linked_files, fetch(:linked_files, []).push('db/production.sqlite3')


# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5


set :rvm1_map_bins, %w{rake gem bundle ruby passenger-config /home/localadmin/.rvm/bin/rvmsudo}

set :passenger_restart_with_sudo, true

after "deploy:migrate", :custom_name
after 'deploy:publishing', :restart_pass



namespace :deploy do

  # task :testlocally do
  #   on "localadmin@woofex.net" do
  #       execute "chown -R www-data "
  #    end
  # end

  task :custom_name do
    on roles(:all) do |host|
      execute "rake sunspot:reindex RAILS_ENV='production'", :shell => fetch(:rvm_shell)
    end
  end



  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
