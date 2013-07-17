require 'spec_helper'

describe 'puppet', :type => :class do
  let(:title) { 'puppet' }
  let(:params) do {
      :version                => '2.7.22-1puppetlabs1',
      :ensure_puppet_service  => 'running',
      :puppetmaster           => 'puppet.exemple.com'
    }
  end

  it do
    should contain_package('puppet', 'puppet-common').with({
      'ensure' => '2.7.22-1puppetlabs1',
    })
  end

  it do
    should contain_package('facter').with({
      'ensure'  => 'latest',
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
