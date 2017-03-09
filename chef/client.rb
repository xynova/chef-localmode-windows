log_level        :info
log_location     STDOUT
chef_server_url  'chefzero://localhost:8889'
validation_client_name 'chef-validator'

current_dir = File.dirname(__FILE__)
chef_repo_path  [ File.expand_path('cookbooks/vendored', current_dir) ]