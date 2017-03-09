log_level        :debug
log_location     STDOUT
chef_server_url  'chefzero://localhost:8889'
validation_client_name 'chef-validator'
chef_repo_path = File.expand_path File.dirname(__FILE__)