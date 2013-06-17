class Cloudkeys 
	def listofcsps
    cloud_provider = ['(1)  Amazon EC2 (VPC only)',
                  '(2)  Amazon EC2-Classic (not yet available)',
                  '(3)  GoGrid (not yet available)',
                  '(4)  OpenStack (not yet available)', 
                  '(5)  Rackspace Cloud (not yet available)', 
                  '(6)  CloudStack (not  yet available)', 
                  '(7)  Windows Azure (not yet available)', 
                  '(8)  Google Compute Engine (not yet available)',
                  '(9)  Red Hat Cloud Infrastructure (not yet available)',
                  '(10) HP Cloud (not yet available)',
                  '(11) Terremark (not yet available)',
                  '(12) SAVVIS (not yet available)',
                  '(13) SingleHop (not yet available)',
                  '(14) Joyent (not yet available)',
                  '(15) Oracle Cloud (not yet available)',
                  '(16) IBM SmartCloud Enterprise (not yet available)',
                  '(17) VMware ESXi',
                  '(18) Kernel-based Virtual Machine (KVM - not yet available)',
                  '(19) Citirix XenServer (not yet available)']
  end
  #### Amazon EC2 keys ####
  def ec2keyakid
    akid = '' # <- Insert EC2 Key ID
    end
  def ec2seckey
    sak = '' # <- Insert EC2 Security Key
	end
  #### Rackspace Cloud keys ####
  def rackkey
    rakid = '' # <- Insert Rackspace Key ID
    end
  def rackseckey
    rsak = '' # <- Insert Rackspace Security Key
  end
end
