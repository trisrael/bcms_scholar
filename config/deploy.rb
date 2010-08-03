#############################################################
#	Application
#############################################################
set :application, "ddcscholar"

set :location, "184.106.197.222" 
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
set :user, "admin"
set :deploy_to, "/home/admin/public_html/#{application}"
set :runner, user
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


# ==============================
# Uploads
# ==============================

namespace :uploads do

  desc <<-EOD
    Creates the upload folders unless they exist
    and sets the proper upload permissions.
  EOD
  task :setup, :except => { :no_release => true } do
    dirs = uploads_dirs.map { |d| File.join(shared_path, d) }
    run "#{try_sudo} mkdir -p #{dirs.join(' ')} && #{try_sudo} chmod g+w #{dirs.join(' ')}"
  end

  desc <<-EOD
    [internal] Creates the symlink to uploads shared folder
    for the most recently deployed version.
  EOD
  task :symlink, :except => { :no_release => true } do
    run "rm -rf #{release_path}/uploads"
    run "ln -nfs #{shared_path}/uploads #{release_path}/uploads"
  end

  desc <<-EOD
    [internal] Computes uploads directory paths
    and registers them in Capistrano environment.
  EOD

  task :register_dirs do
    set :uploads_dirs,    %w(uploads uploads/partners)
    set :shared_children, fetch(:shared_children) + fetch(:uploads_dirs)
  end

  after       "deploy:finalize_update", "uploads:symlink"
  on :start,  "uploads:register_dirs"

end
