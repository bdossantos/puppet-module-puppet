require 'spec_helper'

describe 'puppet', :type => :class do
  let(:title) { 'puppet' }
  let(:params) do {
      :version                => '3.6.2-1puppetlabs1',
      :facter_version         => '2.1.0-1puppetlabs1',
      :ensure_puppet_service  => 'running',
      :puppetmaster           => 'puppet.exemple.com'
    }
  end

  it do
    should contain_package('puppet', 'puppet-common').with({
      'ensure' => '3.6.2-1puppetlabs1',
    })
  end

  it do
    should contain_package('facter').with({
      'ensure'  => '2.1.0-1puppetlabs1',
    })
  end

  it do
    should contain_file('/etc/facter', '/etc/facter/facts.d').with({
      'ensure'  => 'directory',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0755',
    })
  end

  it do
    should contain_file('/etc/puppet/puppet.conf').with({
      'ensure'  => 'present',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0640',
    })
  end

  it do
    should contain_service('puppet').with({
      'ensure' => 'running',
    })
  end
end
