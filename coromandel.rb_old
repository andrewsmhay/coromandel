require 'rubygems'
require 'aws-sdk'
require './lib/cloudkeys.rb'

# List of cloud providers
keymaster = Cloudkeys.new
accesskeyid = keymaster.ec2keyakid
seckeyid = keymaster.ec2seckey
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
    sec_instances << theinstances.id
    sec_pub_ip << theinstances.public_ip_address
    sec_priv_ip << theinstances.private_ip_address
    sec_platform << theinstances.platform
    sec_pub_dns << theinstances.public_dns_name
    sec_priv_dns << theinstances.private_dns_name
  end
    puts "   Instance\tOS\t\tPublic DNS\t\t\t\t\tPublic IP\tInternal DNS"
    sec_instances.each do |instprint|
      puts "#{lgc3}) #{sec_instances[lgc4]}\t#{sec_platform[lgc4]}\t\t#{sec_pub_dns[lgc4]}\t#{sec_pub_ip[lgc4]}\t#{sec_priv_dns[lgc4]}"
      lgc3 += 1
      lgc4 += 1
    end
    puts "\n"
  print "Please select the number of the instance to isolate: "
  iso_inst = gets.to_i
  iso_inst -= 1

  sel_inst = sec_instances[iso_inst]


#=begin  
  puts "\n"
  puts "All traffic will be blocked to and from this instance."
  puts "You will, however, be able to allow access from your analysis station(s)."
  


  puts "\n"
  print "Enter the IP address of your analysis station(s) (e.g. 1.2.3.4, 5.6.7.8, etc.): "
  analyst_ips = gets.gsub("\n","")
  analyst_ips.split(", ").each do |startmeup|
    ip_list << startmeup
  end
  

  puts "\n"
  print "Which TCP ports do you wish to open (e.g. 80, 22, etc.): "
  proto_port = gets.gsub("\n","")
  proto_port.split(", ").each do |portmeup|
    port_proto_list << portmeup
  end
  
  puts "\n"
  print "Allow ICMP from analyst station? [Y/N]: "
  iseempee = gets.gsub("\n","")
  if iseempee =~ /y/i
    puts "\n"
    puts "#{analyst_ips} will be allowed to communicate with #{sec_instances[iso_inst]} on ports #{proto_port} and ICMP"
  else
    puts "\n"
    puts "#{analyst_ips} will be allowed to communicate with #{sec_instances[iso_inst]} on ports #{proto_port}"
  end
#=end

  # ### Ip Addresses
      #
      # In the following example allow incoming SSH from a list of
      # IP address ranges.
      #
      #     security_group.authorize_ingress(:tcp, 22,
      #       '111.111.111.111/0', '222.222.222.222/0')
  
  #refactoring of ports and IP lists for EC2 ingress rules
  awsip_list = ip_list.map! { |diddy| diddy + "/24" }
    
  response = ec2.instances[sel_inst].security_groups
  response.each do |r| 
    rgroup = r.id
  end
    repo = ec2.network_acls
    puts repo.respond_to?(:network_acl_id)
    repo.each do |x|
      puts x.inspect
    end
#=begin #this works
    repo = ec2.security_groups[rgroup].ip_permissions_list
    repo.each do |x|
      ruleval << "Rule #{rulevalnum}"
      useridval << "#{x}"[/:user_id=>"(\d*)"/,1]
      groupidval << "#{x}"[/:group_id=>"(\S*)"/,1]
      groupnameval << "#{x}"[/:group_name=>"([\w\s]*)"/,1]
      cidrval << "#{x}"[/:cidr_ip=>"(\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b\/\d*)"/,1]
      ipprotval << "#{x}"[/:ip_protocol=>"(\w*)"/,1]
      ipfromportval << "#{x}"[/:from_port=>(\d*),/,1]
      iptoportval << "#{x}"[/:to_port=>(\d*)}/,1]
      rulevalnum += 1
    end
    #puts ruleval
    #puts useridval
    #puts groupidval
    #puts groupnameval
    #puts cidrval
    #puts ipprotval
    #puts ipfromportval
    #puts iptoportval
    puts ec2.security_groups[rgroup].ip_permissions_list
    ruleval.each do |ruleconstruct|
    #    ### build the rules for the revoking
    #    ###(:tcp, 22,'111.111.111.111/0', '222.222.222.222/0')
    # THIS WORKS FOR SINGLE PORT RULES - AH
      #puts "#{ruleval[boomit]} is (:#{ipprotval[boomit]}, #{ipfromportval[boomit]}, '#{cidrval[boomit]}')"
      if (("#{ipprotval[boomit]}" != "icmp") && (ipfromportval[boom] != '') && (cidrval[boom] != '') && (ipfromportval = iptoportval))
        ec2.security_groups[rgroup].revoke_ingress(:"#{ipprotval[boom]}", ipfromportval[boom], cidrval[boom])
        puts "Removing (:#{ipprotval[boom]}, #{ipfromportval[boom]}, '#{cidrval[boom]}')"
        boom += 1
      elsif (("#{ipprotval[boomit]}" != "icmp") && (ipfromportval[boom] != '') && (cidrval[boom] != '') && (ipfromportval != iptoportval))
        ec2.security_groups[rgroup].revoke_ingress(:"#{ipprotval[boom]}", "#{ipfromportval[boom]}..#{iptoportval[boom]}", cidrval[boom])
        puts "Removing (:#{ipprotval[boom2]}, #{ipfromportval[boom2]}..#{iptoportval[boom2]}, '#{cidrval[boom2]}')"
        boom2 += 1
      elsif "#{ipprotval[boomit]}" == "icmp"
        ec2.security_groups[rgroup].disallow_ping
        puts "Removing ICMP from (:#{ipprotval[boom3]}, #{ipfromportval[boom3]}, '#{cidrval[boom3]}')"
        boom3 += 1
      else
        puts "Not removing (:#{ipprotval[boom4]}, #{ipfromportval[boom4]}, '#{cidrval[boom]}')"
        boom4 += 1
      end
      #if ipprotval[boom] =~ /icmp/i
      #  ec2.security_groups[rgroup].disallow_ping
      #  puts "Disallowing ICMP"
      #end
      boomit += 1
    end
# end of working block



    #puts revokeit
    #  puts "(:#{ipprotval[boom]}, #{ipfromportval[boom]}, '#{cidrval[boom]}')"
    #  boom += 1
    #end
    #revokeit.each do |blammo|
    #  ec2.security_groups[rgroup].revoke_ingress["#{blammo[pow]}"]
    #  puts "#{blammo}"
    #  pow += 1
    #end



  ## Doing work banner
  ##puts "\n"
  ##puts "Isolating #{sec_instances[iso_inst]} in #{rgroup}..."


 #fumble = ec2.client.describe_security_groups(:group_ids => rgroup)
  #puts fumble
  #repo = ec2.security_groups[rgroup].ip
  
  #repo.disallow_ping # works!
  #repo.revoke_ingress(:tcp, 0..65535)
  #repo.revoke_ingress(:udp, 0..65535)
  #repo.authorize_ingress(:tcp,)

  #ec2.security_groups[rgroup]
  
#  puts ec2.security_group.ip_permissions
puts ec2.network_acls

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


### Need to add an 'end of isolation report' that details exactly what was done 


puts "\n"
puts "Thank you for using Agrippa, happy forensicating!"
