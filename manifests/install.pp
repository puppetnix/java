class java::install  inherits java::params {

  if $::osfamily == Debian {
    # set license for Oracle Java
    exec {'set-license-seen':
      command => '/bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections',
      onlyif  => '/usr/bin/debconf-get-selections | /bin/grep "accepted-oracle-license-v1-1"|/bin/grep "true"|/usr/bin/wc -l|/bin/grep 0',
    }

    package { 'java':
      name => $java_pkg,
      ensure  => "installed",
      require => Exec['set-licence-seen'],
    }

  }

}
