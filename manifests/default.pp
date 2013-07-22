#include base
#include jenkins
#include sonar

node jenkins{
	class { 'jenkins': }
	
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
	class { 'maven::maven' : } ->
	class { 'sonar': 
		version => '3.5.1',
	}
}