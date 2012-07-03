default[:teamcity_build_agent][:server_host] = "http://localhost:8080"
default[:teamcity_build_agent][:user] = "vagrant"
default[:teamcity_build_agent][:install_dir] = "/home/vagrant/buildAgent"
default[:teamcity_build_agent][:zip_dest] = "/tmp/buildAgent.zip"
default[:teamcity_build_agent][:zip_source] = default[:teamcity_build_agent][:server_host] + "/update/buildAgent.zip"

