class base{
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }
  package { jdk:
    ensure => installed,
    name => "openjdk-7-jdk",
  }
}

include base
#include jenkins
include sonar
