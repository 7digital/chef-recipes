recipe "teamcity-build-agent", "Download and installs a build agent"

depends "unzip"
depends "java"

%w{ debian ubuntu }.each do |os|
  supports os
end

