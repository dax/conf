file_cache_path "/tmp/chef"
Chef::Config[:cache_options][:path] = "/tmp/chef/checksum"
cookbook_path "#{ENV['PWD']}/cookbooks"
