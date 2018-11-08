# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'getoptlong'

opts = GetoptLong.new(
  [ '--docker-user', GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--docker-pass', GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--docker-hub', GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--help', GetoptLong::OPTIONAL_ARGUMENT ]
)

username=''
password=''
dockerhub=''

opts.each do |opt, arg|
  case opt
    when '--docker-user'
      username=arg
    when '--docker-pass'
      password=arg
    when '--docker-hub'
      dockerhub=arg
    when '--help'
      puts <<-EOF
      
Build Docker Images Vagrant Optional Argument Help
--------------------------------------------------
--docker-user:
  The docker username for use when uploading to Docker Hub.

--docker-pass:
  The password for use when uploading to Docker Hub.
  
--docker-hub:
  The account name to upload to Docker Hub.

--help:
  This text.
  
      EOF
      exit 0
  end
end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", type: "dhcp"
  config.vm.network :private_network, ip: "192.168.33.254"

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "ansible/vagrant.yml"
  end

  config.vm.provision :shell, :path => "scripts/build_images.sh"

  config.vm.provision :shell, :path => "scripts/docker_push.sh", :args =>"#{username} #{password} #{dockerhub}"

  config.ssh.forward_agent = true
end
