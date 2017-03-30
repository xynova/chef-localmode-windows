log_level           :info
log_location        STDOUT
chef_server_url     'chefzero://localhost:8889'

current_dir = File.dirname(__FILE__)
chef_repo_path [
  File.expand_path(current_dir),
  File.expand_path('cookbooks/vendored', current_dir)]

data_bag_path [File.expand_path('data_bags', current_dir)]
environment_path [File.expand_path('environments', current_dir)]
node_path [File.expand_path('nodes', current_dir)]
role_path [File.expand_path('roles', current_dir)]
file_cache_path [File.expand_path('local_mode_cache/cache', current_dir)]

