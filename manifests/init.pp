class java(
        $version='java7'
        )
{

  if $version == 'java6' or $version == 'java7' or $version == 'java8'{
    include java::params, java::install
  }
  else { 
    fail("Please choose version: java6, java7 or java8")
  }
}
