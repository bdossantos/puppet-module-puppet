class puppet::service {
  case $puppet::ensure_puppet_service {
    'stopped': { $enable = false }
    default: { $enable = true }
  }

  service { 'puppet':
    ensure      => $puppet::ensure_puppet_service,
    hasstatus   => true,
    hasrestart  => true,
    enable      => $enable,
    require     => Class['puppet::install'],
  }
}