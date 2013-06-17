##Coromandel

###About
A Coromandel Screen is a wooden folding screen coated in dark lacquer that is carved before being painted with gold or varied colors. Some may be decorated with precious stones. (<a href="http://quezi.com/3679" target="new">Source</a>)

Coromandel, the tool, was designed to isolate an individual cloud server instance for analysis so that it may be investigated without fear of introducing addtional artifacts not explicitly introduced by the responder and their tools.

###Usage
<pre><code>
$ ruby coromandel.rb
                                 _     _ 
 ___ ___ ___ ___ _____ ___ ___ _| |___| |
|  _| . |  _| . |     | .'|   | . | -_| |
|___|___|_| |___|_|_|_|__,|_|_|___|___|_|

 Created by: Andrew Hay / @andrewsmhay 
 http://github.com/coromandel

Please specify the cloud provider from the list below

(1)  Amazon EC2 (VPC only)
(2)  Amazon EC2-Classic (not yet available)
(3)  GoGrid (not yet available)
(4)  OpenStack (not yet available)
(5)  Rackspace Cloud (not yet available)
(6)  CloudStack (not  yet available)
(7)  Windows Azure (not yet available)
(8)  Google Compute Engine (not yet available)
(9)  Red Hat Cloud Infrastructure (not yet available)
(10) HP Cloud (not yet available)
(11) Terremark (not yet available)
(12) SAVVIS (not yet available)
(13) SingleHop (not yet available)
(14) Joyent (not yet available)
(15) Oracle Cloud (not yet available)
(16) IBM SmartCloud Enterprise (not yet available)
(17) VMware ESXi (not yet available)
(18) Kernel-based Virtual Machine (KVM - not yet available)
(19) Citirix XenServer (not yet available)

Please select the cloud provider ID: 1

You Selected Amazon EC2

   Instance		VPC ID			Public DNS									Public IP		Internal DNS
1) i-0f42be62	vpc-27cb4148	ec2-54-208-29-105.compute-1.amazonaws.com	54.208.29.105	ip-10-0-0-88.ec2.internal

Please select the number of the instance to isolate: 1

All traffic will be blocked to and from this instance.
You will, however, be able to allow access from your analysis station(s).

Enter a unique identifier for this case or incident: casejun172013

Enter the IP address(es) of your analysis station(s) (e.g. 1.2.3.4, 5.6.7.8, etc.): 1.1.1.1, 2.2.2.2

Which TCP port(s) do you wish to open (e.g. 80, 22, etc.): 22, 80, 443

Allow ICMP from analyst station to the target? [Y/N]: Y

===casejun172013===
1.1.1.1, 2.2.2.2 will be allowed to communicate with i-0f42be62 on ports 22, 80, 443.

===New Instance Access Information===

Instance Name	VPC ID			Public DNS									Public IP 		Internal DNS
i-0f42be62		vpc-27cb4148	ec2-54-208-25-165.compute-1.amazonaws.com	54.208.25.165	ip-10-0-0-88.ec2.internal

You may now access i-0f42be62 by connecting to 54.208.25.165 from 1.1.1.1, 2.2.2.2.

Thank you for using Coromandel, happy forensicating!
</code></pre>
###Contact

To provide any feedback or ask any questions please reach out to Andrew Hay on Twitter at <a href="http://twitter.com/andrewsmhay" target="new">@andrewsmhay</a>.
