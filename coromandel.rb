require 'rubygems'
require 'aws-sdk'
require '.lib/cloudkeys.rb'

# List of cloud providers
keymaster = Cloudkeys.new
accesskeyid = keymaster.ec2keyakid
seckeyid = keymaster.ec2seckey
sec_vpc_id = []
sec_group = []
sec_group_id = []
sec_group_vpc = []
sec_group_desc = []
sec_port_prot = []
sec_proto = []
sec_port = []
sec_instances = []
sec_instances_grp = []
sec_priv_ip = []
sec_pub_ip = []
sec_platform = []
sec_pub_dns = []
sec_priv_dns = []
ip_list = []
port_proto_list = []
lgc = 1
lgc2 = 0
lgc3 = 1
lgc4 = 0
rgroup = []
permlista = []
rulenum = 1
useridval = []
groupidval = []
groupnameval = []
cidrval = []
ipprotval = []
ipfromportval = []
iptoportval = []
ruleval = []
rulevalnum = 1
revokeit = []
boom = 0
boom2 = 0
boom3 = 0
boom4 = 0
boomit = 0
pow = 0
thevpcid = ''
bigacl_list = ''
raycount = 0
makeacl = 0
header = "   Instance\tVPC ID\t\tPublic DNS\t\t\t\t\tPublic IP\tInternal DNS"

                                    
puts "                                 _     _ "
puts " ___ ___ ___ ___ _____ ___ ___ _| |___| |"
puts "|  _| . |  _| . |     | .'|   | . | -_| |"
puts "|___|___|_| |___|_|_|_|__,|_|_|___|___|_|"
puts "\n"
puts " Created by: Andrew Hay / @andrewsmhay "
puts " http://github.com/coromandel"
# Cloud provider                                                                                       
puts "\n"
puts "Please specify the cloud provider from the list below"
puts "\n"
puts keymaster.listofcsps
puts "\n"
print "Please select the cloud provider ID: "
cpselect = gets.gsub("\n","")
puts "\n"

if cpselect == "1"
  puts "You Selected Amazon EC2"
  puts "\n"
  ec2 = AWS::EC2.new(
    :access_key_id => "#{accesskeyid}",
    :secret_access_key => "#{seckeyid}")


  ec2.instances.filter('instance-state-name', 'running').each do |theinstances|
  	if theinstances.vpc_id != nil
    	sec_instances << theinstances.id
    	sec_pub_ip << theinstances.public_ip_address
    	sec_priv_ip << theinstances.private_ip_address
    	sec_platform << theinstances.platform
    	sec_pub_dns << theinstances.public_dns_name
    	sec_priv_dns << theinstances.private_dns_name
    	sec_vpc_id << theinstances.vpc_id
    end
  end

    puts header
    sec_instances.each do |instprint|
      puts "#{lgc3}) #{sec_instances[lgc4]}\t#{sec_vpc_id[lgc4]}\t#{sec_pub_dns[lgc4]}\t#{sec_pub_ip[lgc4]}\t#{sec_priv_dns[lgc4]}"
      lgc3 += 1
      lgc4 += 1
    end
    puts "\n"
  print "Please select the number of the instance to isolate: "
  iso_inst = gets.to_i
  iso_inst -= 1

  #Figure out the instance
  sel_inst = sec_instances[iso_inst]
  
  
  #Figure out the VPC ID for that instance
  ec2.instances.filter('instance-id', sel_inst).each do |veepeecee|
    thevpcid = veepeecee.vpc_id
  end

#### CASE NAME, IP ADDRESSES, PORTS, AND ICMP ####
  puts "\n"
  puts "All traffic will be blocked to and from this instance."
  puts "You will, however, be able to allow access from your analysis station(s)."

  puts "\n"
  print "Enter a unique identifier for this case or incident: "
  analyst_case = gets.gsub("\n","")
  puts "\n"

  puts "\n"
  print "Enter the IP address(es) of your analysis station(s) (e.g. 1.2.3.4, 5.6.7.8, etc.): "
  analyst_ips = gets.gsub("\n","")
  analyst_ips.split(", ").each do |startmeup|
    ip_list << startmeup + "/32"
  end
 
  puts "\n"
  print "Which TCP port(s) do you wish to open (e.g. 80, 22, etc.): "
  proto_port = gets.gsub("\n","")
  proto_port.split(", ").each do |portmeup|
    port_proto_list << portmeup.to_i
  end

  puts "\n"
  print "Allow ICMP from analyst station to the target? [Y/N]: "
  iseempee = gets.gsub("\n","")
  puts "\n"
  puts "===#{analyst_case}==="
#### END OF CASE NAME, IP ADDRESSES, PORTS, AND ICMP ####

  puts "#{analyst_ips} will be allowed to communicate with #{sel_inst} on ports #{proto_port}."
  puts "\n"
## Create group using case ID for the VPC
  vpc_sg = ec2.security_groups.create(analyst_case, :vpc_id => thevpcid)
  argh = 0
##   Allow inbound IP addresses as defined in ip_list array on ports in port_proto_list  
  port_proto_list.each do |pushipin|
    ip_list.each {|ip| vpc_sg.authorize_ingress(:tcp, pushipin, ip) } 
  end
  if iseempee =~ /y/i
    ip_list.each do |pingy|
    vpc_sg.allow_ping(pingy) # <- works: allows ICMP from the ip_list
  end
end
  vpc_sg.revoke_egress('0.0.0.0/0') # <- works: removes all oubound access from the default group

## ToDo:
##   'Disassociate address' with instance a.k.a sel_inst
  eip = ec2.elastic_ips.create(:vpc => true)
  ec2.instances[sel_inst].disassociate_elastic_ip
##   'Allocate a new address' with instance a.k.a. sel_inst
  neweip = ec2.instances[sel_inst].associate_elastic_ip(eip)

## Figure out the network interface ID
 ectest = ec2.instances[sel_inst].network_interfaces[0].id
##   Move instance to analyst_case group
 testid = ec2.instances[sel_inst].network_interfaces[0].set_security_groups(vpc_sg)
 
##   Print message that shows everything completed
  new_sec_instances = ''
  new_sec_pub_ip = ''
  new_sec_priv_ip = ''
  new_sec_platform = ''
  new_sec_pub_dns = ''
  new_sec_priv_dns = ''
  new_sec_vpc_id = ''
  ec2.instances.filter('instance-id', sel_inst).each do |newstatus|
      new_sec_instances = newstatus.id
      new_sec_pub_ip = newstatus.public_ip_address
      new_sec_priv_ip = newstatus.private_ip_address
      new_sec_platform = newstatus.platform
      new_sec_pub_dns = newstatus.public_dns_name
      new_sec_priv_dns = newstatus.private_dns_name
      new_sec_vpc_id = newstatus.vpc_id
  end
  puts "===New Instance Access Information==="
  puts "\n"
  puts "Instance Name\tVPC ID\tPublic DNS\tPublic IP\tInternal DNS"
  puts "#{new_sec_instances}\t#{new_sec_vpc_id}\t#{new_sec_pub_dns}\t#{new_sec_pub_ip}\t#{new_sec_priv_dns}"
  puts "\n"
  puts "You may now access #{sel_inst} by connecting to #{new_sec_pub_ip} from #{analyst_ips}."

elsif cpselect == "2"
  puts "Unfortunately #{cpselect} is not available at this time..."
elsif cpselect == "3"
  puts "Unfortunately #{cpselect} is not available at this time..."
elsif cpselect == "4"
  puts "Unfortunately #{cpselect} is not available at this time..."
elsif cpselect == "5"
  puts "Unfortunately #{cpselect} is not available at this time..."
elsif cpselect == "6"
  puts "Unfortunately #{cpselect} is not available at this time..."
elsif cpselect == "7"
  puts "Unfortunately #{cpselect} is not available at this time..."
else
  puts "Unknown Cloud Provider..."
end

puts "\n"
puts "Thank you for using Coromandel, happy forensicating!"