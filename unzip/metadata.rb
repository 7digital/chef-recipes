recipe "unzip","Installs unzip via package manager" 

%w{ debian ubuntu }.each do |os|
  supports os
end

