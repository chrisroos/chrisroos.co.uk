Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update

    # Make is required by at least RedCloth and presumably other Gems
    apt-get install -y make

    # Update Rubygems and install Bundler
    gem update --system 2.7.10
  SHELL
end
