class puppet::configure {
  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Class['puppet::install'],
  }

  file { '/etc/puppet/puppet.conf':
    ensure  => present,
    content => template('puppet/puppet.conf.erb'),
    notify  => Class['puppet::service'],
  }

  file { '/var/lib/puppet/reports':
    ensure  => directory,
    owner   => 'puppet',
    group   => 'puppet',
  }

  file { '/etc/default/puppet':
    ensure  => present,
    content => template('puppet/puppet_opts.erb'),
  }
}
