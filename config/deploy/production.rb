# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

set :stage, :production
set :rails_env, :production
set :branch, 'master'
set :passenger_restart_with_touch, true

server '192.168.0.106', user: 'xi-master', roles: %w[app db web]

# Global options
# --------------
set :ssh_options, {
  forward_agent: false,
  auth_methods: %w[password],
  password: 'masterisreal',
  user: 'xi-master'
}
