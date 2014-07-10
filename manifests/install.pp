class puppet::install {
  package { ['puppet', 'puppet-common', ]:
    ensure  => $puppet::version,
    require => Package['facter'],
  } ->

  package { 'hiera':
    ensure => present,
  }

  package { 'facter':
    ensure => $puppet::facter_version,
  }

  file { ['/etc/facter', '/etc/facter/facts.d', '/etc/puppet/hieradata',]:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
