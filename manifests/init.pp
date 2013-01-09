# Class: jstatd
#
# This module manages jstatd
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class jstatd {

  file { '/etc/jstatd.policy':
    ensure => present,
    source => 'puppet:///modules/jstatd/jstatd.policy',
  }

  file { '/etc/init.d/jstatd':
    ensure  => present,
    mode    => '0755',
    source  => 'puppet:///modules/jstatd/jstatd',
    require => File['/etc/jstatd.policy'],
  }

  service { 'jstatd':
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => File['/etc/init.d/jstatd'],
    subscribe => File['/etc/jstatd.policy']
  }

}
