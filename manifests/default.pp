
node jenkins{	
	class{ 'jenkins':
   		config_hash => {
     		'HTTP_PORT' => { 'value' => '9090' }, 'AJP_PORT' => { 'value' => '9009' }
   		},
	}

#	file { '/var/lib/jenkins/config.xml':
#		ensure => present,
#		source => "puppet:///modules/files/jenkins.config.xml"
#	}
	
	jenkins::plugin {
  		"WebSVN2" :
  			version => "0.9";
	}
	jenkins::plugin {
  		"disk-usage" :
  			version => "0.20";
	}
	jenkins::plugin {
  		"m2release" :
  			version => "0.11.0";
	}
	jenkins::plugin {
  		"token-macro" :
  			version => "1.8.1";
	}
	jenkins::plugin {
  		"run-condition" :
  			version => "0.10";
	}
	jenkins::plugin {
  		"jobConfigHistory" :
  			version => "2.4";
	}
	jenkins::plugin {
  		"jenkinswalldisplay" :
  			version => "0.6.17";
	}
	jenkins::plugin {
  		"nested-view" :
  			version => "1.10";
	}
	jenkins::plugin {
  		"xvnc" :
  			version => "1.14";
	}
	jenkins::plugin {
  		"conditional-buildstep" :
  			version => "1.3";
	}
	jenkins::plugin {
  		"throttle-concurrents" :
  			version => "1.7.2";
	}
	jenkins::plugin {
  		"copyartifact" :
  			version => "1.27";
	}
	jenkins::plugin {
  		"gradle" :
  			version => "1.23";
	}
	jenkins::plugin {
  		"mask-passwords" :
  			version => "2.7.2";
	}
	jenkins::plugin {
  		"repository-connector" :
  			version => "0.8.2";
	}
	jenkins::plugin {
  		"sitemonitor" :
  			version => "0.4";
	}

	# Build-Pipeline-Plugin
	jenkins::plugin {
  		"build-pipeline-plugin" : 
  			version => "1.3.5";
	}
	jenkins::plugin {
  		"parameterized-trigger" :
  			version => "2.18";
	}
	jenkins::plugin {
  		"jquery" :
  			version => "1.7.2-1";
	}
	jenkins::plugin {
  		"dashboard-view" :
  			version => "2.8";
	}	
}

node sonar{	
	$jdbc = {
	  url               => 'jdbc:h2:tcp://localhost:9092/sonar',
	  driver_class_name => 'org.h2.Driver',
	  validation_query  => 'select 1',
	  username          => 'sonar',
	  password          => 'sonar',
	}
	class { 'apt':
  		always_apt_update    => true,
  	}
	class { 'java':
  		distribution => 'jdk',
  		version      => 'latest',
	} ->
	class { 'maven::maven' : } ->
	class { 'sonar' :
	  version      => '3.6.2',
	  jdbc         => $jdbc,
	}
}