# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'carrierwave_s3_test'
set :scm, :git
set :repo_url, 'git@github.com:sosimple733/carrierwave_s3_test.git'
set :deploy_to, '/home/ubuntu/apps/carrierwave_s3_test'
set :rvm_ruby_version, '1.9.3-p547'
set :default_env, { rvm_bin_path: '~/.rvm/bin' }

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/home/ubuntu/apps/deploytest'
# set :deploy_to, '/var/www/my_app'

set :branch, "master"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
######### Put the database.yml in share/config/ directory and it will link it #########
  set :linked_files, %w{config/database.yml}
#########  

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

######### rvm bin path #########
  # set :default_env, { rvm_bin_path: '~/.rvm/bin' }
#########


# Default value for keep_releases is 5
set :keep_releases, 3

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')

    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end