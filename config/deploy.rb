require 'bundler/capistrano'

set :application, "registermyinfo"
set :repository,  "https://github.com/zoeoberon/myinfo-rails3-example.git"

set :scm, :git 

set :deploy_to, "/home/jehughes/webapps/#{application}"

role :web, "web335.webfaction.com"  # Your HTTP server, Apache/etc
role :app, "web335.webfaction.com"  # This may be the same as your `Web` server
role :db,  "web335.webfaction.com", :primary => true # This is where Rails migrations will run

set :user, "jehughes"
set :scm_username, "zoeoberon"
set :use_sudo, false
default_run_options[:pty] = true

after "deploy", "deploy:copy_ignored_files"
after "deploy:copy_ignored_files", "deploy:restart_passenger"

namespace :deploy do
  task :copy_ignored_files do
    run "cp #{deploy_to}/shared/local_config/*.yml #{deploy_to}/current/config"
  end
  task :restart_passenger do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end
  task :restart do
    run "#{deploy_to}/bin/restart" 
  end
end
