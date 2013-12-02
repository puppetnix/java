class java::params{

  case $::osfamily {

    Debian: {
      if $java::version == 'java6'{
        $java_pkg=['oracle-java6-installer']
        #$java_dst is folder where located java source (bin, lib ... folders)
        $java_dst='/usr/lib/jvm/java-6-oracle/jre'
      }
      if $java::version == 'java7'{
        $java_pkg=['oracle-java7-installer']
        $java_dst='/usr/lib/jvm/java-7-oracle/jre'
      }
    }

    default: {
      err("Module java is not supported on ${::operatingsystem}")
    }

  }

}
