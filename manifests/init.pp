class puppet(
  $version = '2.7.21-1puppetlabs1',
  $ensure_puppet_service = 'running',
  $puppetmaster = 'puppet.exemple.com'
) {
  include puppet::install,
          puppet::configure,
          puppet::service
}