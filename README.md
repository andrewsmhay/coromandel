##Coromandel

###About
A Coromandel Screen is a wooden folding screen coated in dark lacquer that is carved before being painted with gold or varied colors. Some may be decorated with precious stones. (<a href="http://quezi.com/3679" target="new">Source</a>)

Coromandel, the tool, was designed to isolate an individual cloud server instance for analysis so that it may be investigated without fear of introducing addtional  artifacts not explicitly introduced by the responder and their tools.

###Usage
<pre><code>
$ ruby coromandel.rb
                                 _     _ 
 ___ ___ ___ ___ _____ ___ ___ _| |___| |
|  _| . |  _| . |     | .'|   | . | -_| |
|___|___|_| |___|_|_|_|__,|_|_|___|___|_|

 Created by: Andrew Hay / @andrewsmhay 
 http://github.com/Agrippa

Please specify the cloud provider from the list below

(1) Amazon EC2
(2) GoGrid (not available)
(3) OpenStack (not available)
(4) Rackspace Cloud (not available)
(5) CloudStack (not available)
(6) Windows Azure (not available)
(7) Google Compute Engine (not available)

Please select the cloud provider ID: 1

You Selected Amazon EC2

   Instance		VPC ID			Public DNS									Public IP		Internal DNS
1) i-0f42be62	vpc-27cb4148	ec2-54-208-34-105.compute-1.amazonaws.com	54.208.34.105	ip-10-0-0-88.ec2.internal

Please select the number of the instance to isolate: 1

All traffic will be blocked to and from this instance.
You will, however, be able to allow access from your analysis station(s).

Enter a unique identifier for this case or incident: case1234


Enter the IP address of your analysis station(s) (e.g. 1.2.3.4, 5.6.7.8, etc.): 1.2.3.4, 2.3.4.5
1.2.3.4, 2.3.4.5

Which TCP ports do you wish to open (e.g. 80, 22, etc.): 22, 443, 8080

Allow ICMP from analyst station to the target? [Y/N]: Y

===case1234===
1.2.3.4, 2.3.4.5 will be allowed to communicate with ec2-54-208-34-105.compute-1.amazonaws.com on ports 22, 443, 8080 and via ICMP

Thank you for using Coromandel, happy forensicating! 
</code></pre>
###Contact

To provide any feedback or ask any questions please reach out to Andrew Hay on Twitter at <a href="http://twitter.com/andrewsmhay" target="new">@andrewsmhay</a>.
