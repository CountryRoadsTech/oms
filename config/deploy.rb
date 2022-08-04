# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.17.0'

set :application, 'oms'

set :repo_url, 'git@github.com:CountryRoadsTech/oms.git'
set :branch, :main

set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_files, 'config/master.key'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads', 'vendor',
       'storage'

set :rails_env, 'production'

set :rbenv_type, :user
set :rbenv_ruby, '3.1.2'

set :deploytag_utc, false

set :migration_role, :app

set :keep_releases, 10
set :keep_assets, 10

# Disable db:console push actions
set :disallow_pushing, true

namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app), in: :sequence, wait: 10 do
        unless test("[ -f #{shared_path}/config/master.key ]")
          upload! 'config/master.key', "#{shared_path}/config/master.key"
        end
      end
    end
  end
end
