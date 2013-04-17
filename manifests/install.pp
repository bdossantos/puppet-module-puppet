class puppet::install {
  package { ['puppet', 'puppet-common']:
    ensure  => $puppet::version,
    require => Package['facter'],
  }

  package { 'facter':
    ensure => latest,
  }
}