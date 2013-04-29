class puppet::install {
  package { ['puppet', 'puppet-common']:
    ensure  => $puppet::version,
    require => Package['facter'],
  }

  package { 'facter':
    ensure => latest,
  }

  file { ['/etc/facter', '/etc/facter/facts.d']:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
