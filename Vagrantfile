# -*- mode: ruby -*-
# vim: set ft=ruby :

MACHINES = {
  :otuslinux => {
        :box_name => "ubuntu",
        :vm_name => "ubuntu",
        :ip_addr => '192.168.56.101',		
  },
}
Vagrant.configure("2") do |config|
          config.vm.box = "ubuntu"
          config.vm.provider "virtualbox" do |vb|
           vb.memory = 1024
           vb.cpus = 1
       end


      config.vm.define "nfs-server" do |nfsserver|
          
          nfsserver.vm.host_name = "nfs-server"
          nfsserver.vm.synced_folder ".", "/home/pt/vagrant/nfs"
          nfsserver.vm.network "private_network", ip: '192.168.56.101'
          
#         box.vm.disk :disk, size: "1GB", name: "extra_storage"
#	  (0..4).each do |i|
# 	     box.vm.disk :disk, size: "250MB", name: "disk-#{i}"
#    	end
#	end
 	  nfsserver.vm.provision "shell", inline: <<-SHELL
	      mkdir -p ~root/.ssh
              cp ~vagrant/.ssh/auth* ~root/.ssh
              sudo sed -i 's/\#PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
              systemctl restart sshd
	  sh /home/pt/vagrant/nfs/1_s_install_nfs.sh
	  echo "Step install_nfs - OK"
	  sleep 10  
	  sh /home/pt/vagrant/nfs/2_s_ss_tunel.sh
	  echo "Step ss_tunel - OK. See result"
	  sleep 10 
	  sh /home/pt/vagrant/nfs/3_s_make_dir.sh
	  echo "Step make_dir - OK. See result"
	  sleep 10
	  sh /home/pt/vagrant/nfs/4_nano_exports.sh
	  echo "Step nano_exports - OK. See result"
	  sleep 10
	  echo "nfs-server - DONE. Go to nfs-client"
	  sleep 20
	  
	  
  	  SHELL
#      end
  end
  
        config.vm.define "nfs-client" do |nfsclient|
          nfsclient.vm.box = "ubuntu"
          nfsclient.vm.host_name = "nfs-client"
          nfsclient.vm.synced_folder ".", "/home/pt/vagrant/nfs"
          #box.vm.network "forwarded_port", guest: 3260, host: 3260+offset
          nfsclient.vm.network "private_network", ip: '192.168.56.102'
          
#         box.vm.disk :disk, size: "1GB", name: "extra_storage"
#	  (0..4).each do |i|
# 	     box.vm.disk :disk, size: "250MB", name: "disk-#{i}"
#    	end
#	end
 	  nfsclient.vm.provision "shell", inline: <<-SHELL
	      mkdir -p ~root/.ssh
              cp ~vagrant/.ssh/auth* ~root/.ssh
              sudo sed -i 's/\#PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
              systemctl restart sshd
	  sh /home/pt/vagrant/nfs/c_1_install_nfs.sh
	  echo "Step install_nfs finished"
	  sleep 10  
         sh /home/pt/vagrant/nfs/c_2_nano_fstab.sh
	  echo "Step nano_fstab finished. See result"
	  sleep 10  
	  echo "ALL DONE. Now you can check wokr."
  	  SHELL
#      end
  end
  
  
end
