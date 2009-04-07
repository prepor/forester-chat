set :user, "root"
set :password, 'hzdsed'

set :use_sudo, false

set :deploy_via, :remote_cache

set :application, "fchat"
set :repository,  "git@github.com:preprocessor/forester-chat.git"
set :scm, :git

set :branch, "master"
set :deploy_to, "/home/#{application}"


# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "70.87.222.44"
role :web, "70.87.222.44"
role :db,  "70.87.222.44", :primary => true


# namespace :deploy do
#   desc "Restart Application"
#   task :restart do
#     run "touch #{current_path}/tmp/restart.txt"
#   end
# end


# after :deploy, "passenger:restart"

# 
# desc "copy the database.yml file over"
# task :copy_prod_db_file do 
#   run "cp -f #{release_path}/config/database.yml.server #{release_path}/config/database.yml"
# end
# 
# after 'deploy:update_code', :copy_prod_db_file