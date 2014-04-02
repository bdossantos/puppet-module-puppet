class puppet(
  $version = '2.7.23-1puppetlabs1',
  $facter_version = '1.7.5-1puppetlabs1',
  $ensure_puppet_service = 'running',
  $puppetmaster = 'puppet.exemple.com'
) {
  include puppet::install,
          puppet::configure,
          puppet::service
}
