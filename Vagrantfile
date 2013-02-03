Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.forward_port 80, 4567
  config.vm.forward_port 8080, 4568
  config.vm.forward_port 9000, 4569

  # Enable the Puppet provisioner
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.options = "--trace --debug"
    puppet.manifest_file  = "default.pp"
    puppet.module_path = "modules"
  end
end
