require 'aws-sdk'

# List of cloud providers
cloud_provider = ['(1) Amazon EC2', '(2) GoGrid', '(3) OpenStack', '(4) Rackspace Cloud', '(5) CloudStack', '(6) Windows Azure', '(7) Google Compute Engine']

# Cloud provider
puts "Please specify the cloud provider from the list below"
puts cloud_provider
print "Cloud Provider ID: "
cpselect = gets

#Case statement for cloud provider

# Use a yaml file for each provider set of credentials
ec2 = AWS::EC2.new(
  :access_key_id => 'YOUR_ACCESS_KEY_ID',
  :secret_access_key => 'YOUR_SECRET_ACCESS_KEY')

# Get a list of security groups

# Ask for which security group to isolate

#host IP to isolate
print "Please specify the server IP to isolate [e.g. 1.2.3.4]: "
isolateip = gets

# Generate graph of allowed IP/port communications
