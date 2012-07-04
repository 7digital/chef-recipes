recipe "network-setup", "Sets the IP of the machine"

%w{ debian ubuntu }.each do |os|
  supports os
end

