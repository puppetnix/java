class java::install  inherits java::params {

  if $::osfamily == Debian {
    #add repose with oracle java packages to sourse.list
    apt::source { 'webupd8team-java-precise':
      location       => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
      release       => 'precise',
      repos        => 'main',
      include_src => false
    }
    
    # set licese for Oracle Java
    exec {'set-licence-seen':
      command => '/bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections',
      onlyif  => '/usr/bin/debconf-get-selections | /bin/grep "accepted-oracle-license-v1-1"|/bin/grep "true"|/usr/bin/wc -l|/bin/grep 0',
      require   => Apt::Source['webupd8team-java-precise'],
    }

    package { 'java':
      name => $java_pkg,
      ensure  => "installed",
      require => Exec['set-licence-seen'],
    }

  }

}
