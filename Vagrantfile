Vagrant.configure("2") do |config|
  config.vm.box = "precise32"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.options = "--trace --debug"
    puppet.manifest_file  = "default.pp"
    puppet.module_path = "modules"    
  end

  config.vm.define :jenkins do |jenkins_config|
    jenkins_config.vm.hostname = "jenkins"
    jenkins_config.vm.network :forwarded_port, guest:9090, host: 4568
  end  

  config.vm.define :sonar do |sonar_config|
    sonar_config.vm.hostname = "sonar"
    sonar_config.vm.network :forwarded_port, guest:9000, host: 4569
  end

end
