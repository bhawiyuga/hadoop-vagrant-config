Vagrant.require_version ">= 1.4.3"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	numNodes = 2
	r = numNodes..1
	(r.first).downto(r.last).each do |i|
		config.vm.define "node#{i}" do |node|
			node.vm.box = "bhawiyuga/hadoop-spark"
			node.vm.provider "virtualbox" do |v|
			    v.name = "node#{i}"
			    v.customize ["modifyvm", :id, "--memory", "1024"]
			    #if i == 2
			    #    v.customize ["modifyvm", :id, "--memory", "2048"]
			    #end
			end
			if i < 10
			node.vm.network :private_network, ip: "192.168.56.12#{i}"
			else
				node.vm.network :private_network, ip: "192.168.56.1#{i}"
			end
			node.vm.hostname = "node#{i}"
			
			node.vm.provision "shell", path: "scripts/setup-ubuntu.sh"
			node.vm.provision "shell", path: "scripts/setup-ubuntu-ntp.sh"
			
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-ubuntu-hosts.sh"
				s.args = "-t #{numNodes}"
			end

			
			#node.vm.provision "shell", path: "scripts/setup-java-openjdk.sh"
			node.vm.provision "shell", path: "scripts/setup-hadoop.sh"
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-hadoop-slaves.sh"
				s.args = "-s 1 -t #{numNodes}"
			end
			

			#node.vm.provision "shell", path: "scripts/setup-hbase.sh"
			#node.vm.provision "shell", path: "scripts/setup-scala.sh"
			#node.vm.provision "shell", path: "scripts/setup-sparkR.sh"
			
			#node.vm.provision "shell" do |s|
			#	s.path = "scripts/setup-hbase-slaves.sh"
			#	s.args = "-s 3 -t #{numNodes}"
			#end
			#if i == 2
			#	node.vm.provision "shell", path: "scripts/setup-zookeeper.sh"
			#else
			#	node.vm.provision "shell", path: "scripts/setup-zookeeper-client.sh"
			#end
			
			node.vm.provision "shell", path: "scripts/setup-spark.sh"
			
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-spark-slaves.sh"
				s.args = "-s 1 -t #{numNodes}"
			end

			if i == 1
				node.vm.provision "shell", privileged: false do |s|
					s.path = "scripts/setup-ssh.sh"
					s.args = "-t #{numNodes}"
				end
			end

			if i == 2            
                #node.vm.provision "shell", path: "scripts/setup-slider.sh"
				#node.vm.provision "shell", path: "scripts/setup-spark.sh"
				#node.vm.provision "shell", path: "scripts/setup-elk.sh"
				#node.vm.provision "shell", path: "scripts/setup-jaguar.sh"
			end
			#node.vm.provision "shell", path: "scripts/setup-metrics.sh"
		end
	end

	
end