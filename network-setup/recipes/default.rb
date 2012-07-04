begin
puts 'Setting IP address to ' + node[:ip_address]
system('sudo ifconfig eth1 down')
system('sudo ifconfig eth1 ' + node[:ip_address] + ' netmask ' +node[:netmask] + ' up')

puts 'Setting Default Gateway to ' + node[:gateway]
system('sudo route add default gw '+ node[:gateway])
end
