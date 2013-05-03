require 'aws-sdk'

# List of cloud providers
cloud_provider = ["(1) Amazon EC2",
                  "(2) GoGrid (not available)",
                  "(3) OpenStack (not available)", 
                  "(4) Rackspace Cloud (not available)", 
                  "(5) CloudStack (not available)", 
                  "(6) Windows Azure (not available)", 
                  "(7) Google Compute Engine (not available)"]

# Cloud provider
puts "Please specify the cloud provider from the list below"
puts cloud_provider
print "Cloud Provider ID: "
cpselect = gets.gsub("\n","")

if cpselect == "1"
  puts "You Selected Amazon EC2"
 # puts "Please enter your Access Key ID: "
 # akid = gets.gsub("\n","")
 # puts "Please enter your Secret Access Key: "
 # sak = gets.gsub("\n","")
  ec2 = AWS::EC2.new(
    # :access_key_id => akid,
    :access_key_id => 'AKIAIAGD5BGI2XTK5XIA',
    :secret_access_key => 'VFr9dteoZAkDYCXZ/34vkpNn21GW9/kWZTlDtbv+')
    # :secret_access_key => sak)
#  puts ec2.security_group.ip_permissions
puts ec2.network_acls

elsif cpselect == "2"
  puts "gogrid"
elsif cpselect == "3"
  puts "openstack"
elsif cpselect == "4"
  puts "rackspace"
elsif cpselect == "5"
  puts "cloudstack"
elsif cpselect == "6"
  puts "azure"
elsif cpselect == "7"
  puts "gce"
else
  puts "Unknown Cloud Provider..."
end


# Get a list of security groups

# Ask for which security group to isolate

#host IP to isolate
#print "Please specify the server IP to isolate [e.g. 1.2.3.4]: "
#isolateip = gets

# Generate graph of allowed IP/port communications

