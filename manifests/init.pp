class puppet(
  $version = '3.6.2-1puppetlabs1',
  $facter_version = '2.1.0-1puppetlabs1',
  $ensure_puppet_service = 'running',
  $puppetmaster = 'puppet.exemple.com'
) {
  include puppet::install,
          puppet::configure,
          puppet::service
}
