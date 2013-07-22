Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  #config.vm.forward_port 80, 4567
  #config.vm.forward_port 9000, 4569

  # Enable the Puppet provisioner
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.options = "--trace --debug"
    puppet.manifest_file  = "default.pp"
    puppet.module_path = "modules"
  end

  config.vm.define :jenkins do |jenkins_config|
    jenkins_config.vm.hostname = "jenkins"
    jenkins_config.vm.network :forwarded_port, guest:8080, host: 4568
  end  

config.vm.define :sonar do |sonar_config|
    sonar_config.vm.hostname = "sonar"
    sonar_config.vm.network :forwarded_port, guest:9000, host: 4569
  end    

#config.vm.define :db do |db_config|
#    db_config.vm.host_name = "db"
#  end  
end
