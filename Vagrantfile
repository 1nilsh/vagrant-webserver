Vagrant.configure("2") do |config|
    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://vagrantcloud.com/search.
    config.vm.box = "ubuntu/bionic64"

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
    end

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network "private_network", ip: "192.168.34.10"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    config.vm.synced_folder "./www/", "/var/www",
        owner: "www-data", group: "www-data", mount_options: ["dmode=775,fmode=775"]

    # Enable provisioning with a shell script. Additional provisioners such as
    # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
    # documentation for more information about their specific syntax and use.
    config.vm.provision "shell", inline: "usermod -aG www-data vagrant"
    config.vm.provision "shell", path: "config/bootstrap.sh"

end
