# -*- mode: ruby -*-
# vi: set ft=ruby :

#
#  MYSQL MULTI-NODE CLUSTER

#--------------------
#
# Items to cover
#
# box(es)
# host name(s)
# network
# shared folders
# chef omnibus install
# recipes to call
#
#--------------------

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

# Vagrant version
Vagrant.require_version '>= 1.5.0'


# CONFIGURATION - START

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #  ------  GLOBAL SETTINGS BEGIN ------
  #  These will apply for all servers created by this file
  #

  # Box
  config.vm.box = 'oracle-oel65-64'
  config.vm.box_url = 'https://storage.us2.oraclecloud.com/v1/istoilis-istoilis/vagrant/oel65-64.box'
  #config.ssh.password = 'vagrant'
  
  # Box override  if using vmware_fusion
  config.vm.provider "vmware_fusion" do |v, override|
    override.vm.box = 'bento/ubuntu-14.04'
  end

  # Shared folders
  #config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
  #config.vm.synced_folder "../data", "/vagrant_data"

  #  ------  GLOBAL SETTINGS END ------
  #

  #  ------  SERVER DEFINITIONS BEGIN  -----------------
  #  Specify for either provider - will pickup whatever is relevant in the environment


   # Begin mysqln1

     # Begin mysqln1
    config.vm.define "mysqln1" do |mysqln1|

      # hostname
      mysqln1.vm.hostname = "mysqln1"

      # customization syntax for vmware 
      mysqln1.vm.provider "vmware_fusion" do |v|
          v.vmx["numvcpus"] = "1"
          v.vmx["memsize"] = "512"
      end
   
      # customization syntax for virtualbox
      mysqln1.vm.provider "virtualbox" do |v|
          v.customize [ "modifyvm", :id, "--cpus", "1" ]
          v.customize [ "modifyvm", :id, "--memory", "512" ]
      end

      # Network
      #mysqln1.vm.network "private_network", ip: "192.168.205.10"
      mysqln1.vm.network "private_network", ip: "192.168.65.31", virtualbox__intnet: true

      # Provisioning steps

      # Shell provisioner
      #mysqln1.vm.provision :shell, inline: 'echo mysqln1 shell provision echo'

      # Chef provisioner --> already version 11 is on Oracle's vagrant box
      #mysqln1.omnibus.chef_version = '12.0.4'

      mysqln1.vm.provision :chef_solo do |chef|
        chef.run_list = [
        'recipe[cblamp1::default]','recipe[cblamp1::update_etc_hosts]','recipe[cblamp1::install_cluster_software]','recipe[cblamp1::create_mysql_config_files]', 'recipe[cblamp1::start_cluster_processes]'
        #'recipe[cblamp1::default]','recipe[cblamp1::update_etc_hosts]','recipe[cblamp1::create_mysql_config_files]','recipe[cblamp1::start_cluster_processes]'
        #'recipe[cblamp1::default]','recipe[cblamp1::update_etc_hosts]','recipe[cblamp1::install_cluster_software]','recipe[cblamp1::create_mysql_config_files]'

        ]
      end

    end

   # End mysqln1

   # Begin mysqln2
    config.vm.define "mysqln2" do |mysqln2|
      mysqln2.vm.hostname = "mysqln2"
   
      mysqln2.vm.provider "vmware_fusion" do |v|
          v.vmx["numvcpus"] = "1"
          v.vmx["memsize"] = "512"
      end
   
      mysqln2.vm.provider "virtualbox" do |v|
          #v.customize [ "modifyvm", :id, "--cpus", "1" ]
          #v.customize [ "modifyvm", :id, "--memory", "512" ]

          v.cpus = "1"
          v.memory = "768"
      end

      # Network
      mysqln2.vm.network "private_network", ip: "192.168.65.32", virtualbox__intnet: true

      # Provisioning steps

      # Shell provisioner
      #mysqln2.vm.provision :shell, inline: 'echo mysqln2 shell provision echo'

      # Chef provisioner --> already version 11 is on Oracle's vagrant box
      #mysqln2.omnibus.chef_version = '12.0.4' 

      mysqln2.vm.provision :chef_solo do |chef|
        chef.run_list = [
        'recipe[cblamp1::default]','recipe[cblamp1::update_etc_hosts]','recipe[cblamp1::install_cluster_software]','recipe[cblamp1::create_mysql_config_files]', 'recipe[cblamp1::start_cluster_processes]'
        #'recipe[cblamp1::default]','recipe[cblamp1::update_etc_hosts]','recipe[cblamp1::create_mysql_config_files]','recipe[cblamp1::start_cluster_processes]'
        #'recipe[cblamp1::default]','recipe[cblamp1::update_etc_hosts]','recipe[cblamp1::install_cluster_software]','recipe[cblamp1::create_mysql_config_files]'

      ]
      end     

    end
    # End mysqln2


    # Begin webapp1
    config.vm.define "webapp1" do |webapp1|
      webapp1.vm.hostname = "webapp1"
   
      webapp1.vm.provider "vmware_fusion" do |v|
          v.vmx["numvcpus"] = "1"
          v.vmx["memsize"] = "512"
      end
   
      webapp1.vm.provider "virtualbox" do |v|
          #v.customize [ "modifyvm", :id, "--cpus", "1" ]
          #v.customize [ "modifyvm", :id, "--memory", "512" ]

          v.cpus = "1"
          v.memory = "768"
      end

      # Network
      webapp1.vm.network "private_network", ip: "192.168.65.51", virtualbox__intnet: true

      # Provisioning steps

      # Shell provisioner
      #webapp1.vm.provision :shell, inline: 'echo webapp1 shell provision echo'

      # Chef provisioner --> already version 11 is on Oracle's vagrant box
      #webapp1.omnibus.chef_version = '12.0.4' 

      webapp1.vm.provision :chef_solo do |chef|
        chef.run_list = [
        'recipe[cblamp1::default]','recipe[cblamp1::update_etc_hosts]', 'recipe[cblamp1::install_httpd]', 'recipe[cblamp1::install_php]'
        #'recipe[cblamp1::default]','recipe[cblamp1::update_etc_hosts]', 'recipe[cblamp1::install_httpd]'
        #'recipe[cblamp1::install_php]'
       ]
      end     

    end
    # End webapp1

    #  ------  SERVER DEFINITIONS END  -----------------

end  
# CONFIGURATION - END



