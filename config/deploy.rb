#############################################################
#	Application
#############################################################
set :application, "ddcscholar"

set :location, "10.179.100.215" 
role :app, location
role :web, location
role :db, location , :primary => true

#############################################################
#	SCM/Repository
#############################################################

set :scm, :git
set :repository,  "git://github.com/trisrael/bcms_scholar.git"



#############################################################
#	Server
#############################################################


#server "184.106.197.222", :app, :web, :db, :primary => true
set :user, "root"
set :deploy_to, "/var/www/public_html/#{application}"
set :runner, root
set :use_sudo, false


#############################################################
#	SSH
#############################################################

set :port, 30000

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

 namespace :uploads do
   task :copy_to_shared do
        #Force overwrite the shared area
	run "rm -rf public_html/ddcscholar/shared/uploads"
	run "cp -R public_html/ddcscholar/current/uploads public_html/ddcscholar/shared/uploads"
   end

   task :copy_to_current do
       run "rm -rf public_html/ddcscholar/current/uploads"
       run "cp -R public_html/ddcscholar/shared/uploads public_html/ddcscholar/current/uploads"
   end
  end

before "deploy:update", "uploads:copy_to_shared"
after "deploy:update", "uploads:copy_to_current"

