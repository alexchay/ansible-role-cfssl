require 'serverspec'

set :backend, :exec
#set :backend, :ssh
#set :host, ENV['TARGET_HOST']
#set :ssh_options, :user => ENV['LOGIN_USER'], :paranoid => false, :verbose => :error, :host_key => 'ssh-rsa', :keys => [ ENV['SSH_KEY'] ] if ENV['SSH_KEY']

