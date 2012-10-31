set :application, "MAD-IS"
set :repository,  "https://ph.ccg.tw/git/mad_is.git/"

set :scm, :git
set :deploy_to, "/home/mad/mad_is"
set :user, "mad"

set :gateway, "140.114.71.24:2022"
set :use_sudo, false

#ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]

role :web, "140.114.71.24:2022"                          # Your HTTP server, Apache/etc
role :app, "140.114.71.24:2022"                          # This may be the same as your `Web` server
role :db,  "140.114.71.24:2022", :primary => true # This is where Rails migrations will run

# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end