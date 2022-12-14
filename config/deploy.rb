# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

set :application, "jomi.fun"
set :repo_url, "git@github.com:jacr1102/jomis.git"
set :use_sudo, true
set :rvm_ruby_version, 'ruby-2.7.4'
set :pty,  false
#append :linked_files, 'config/application.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'tmp/journals','tmp/logos', 'vendor/bundle', 'public/system', 'private', "public/packs", ".bundle", "node_modules"

#set :bundle_dir, "/usr/share/rvm/rubies/ruby-2.7.4"
set :migration_role, :app
set :conditionally_migrate, true

after 'deploy:finished', 'nginx:reload'
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
