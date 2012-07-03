zip_dest = node['teamcity_build_agent']['zip_dest']
zip_source = node['teamcity_build_agent']['zip_source']
server_host = node['teamcity_build_agent']['server_host']
install_dir = node['teamcity_build_agent']['install_dir']
user = node['teamcity_build_agent']['user']

remote_file zip_dest do
  owner user
  source zip_source
  action :create_if_missing
end

directory install_dir do
  action :delete
  recursive true
end

directory install_dir do
  owner user
  mode "0755"
  action :create
end

bash "unzip-buildAgent" do
  user user
  code <<-EOH
    unzip #{zip_dest} -d #{install_dir}
  EOH
end

file install_dir + "/bin/install.sh" do
  action :touch
  mode 00755
end

bash "install-buildAgent" do
  user user
  cwd install_dir + "/bin"
  code <<-EOH 
    ./install.sh #{server_host}
  EOH
end

file install_dir + "/bin/agent.sh" do
  action :touch
  mode 00755
end

bash "ensure-buildAgent-running" do
  user user
  not_if "pgrep -f buildServer.agent.Launcher"
  cwd install_dir + "/bin"
  code <<-EOH
    export JRE_HOME=/usr
    ./agent.sh start
  EOH
end

file zip_dest do
  action :delete
end
