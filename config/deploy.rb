# config valid only for current version of Capistrano
lock '3.17.0'

set :application, 'HuntiCloud'
set :repo_url, 'git@github.com:loqimean/HuntiCloud.git'

set :linked_files, %w[config/master.key config/credentials.yml.enc]

# Only keep the last 5 releases to save disk space
set :keep_releases, 5

# restart app by running: touch tmp/restart.txt
# at server machine
set :passenger_restart_with_touch, true

##################################################################################################################################
set :puma_threads, [4, 16]

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/xi-master/#{fetch :application}"
