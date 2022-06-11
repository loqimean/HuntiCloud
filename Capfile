# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# This will add tasks to your deploy process
require 'capistrano/rails'
require 'capistrano/passenger'
require 'capistrano/rvm'
require 'capistrano/yarn'
require 'capistrano/bundler'
require 'capistrano/linked_files'

# If you are using rbenv add these lines:
set :rvm_type, :user
set :rvm_ruby_version, '3.1.2'

# Load the SCM plugin appropriate to your project:
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
