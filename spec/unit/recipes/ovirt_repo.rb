require 'chefspec'
require 'chefspec/berkshelf'

describe 'guest-agent::ovirt_repo' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }
  it 'install ovirt-guest-agent package' do
    expect(chef_run).to install_package 'ovirt-guest-agent'
  end

  it 'enable ovirt-guest-agent service' do
    expect(chef_run).to enable_service 'ovirt-guest-agent'
  end
end

# Regression Tests

describe 'CentOS setup' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(
      platform: 'centos',
      version:  '6.3'
      )
    runner.converge('guest-agent::ovirt_repo')
  end

  it 'should include the yum recipe' do
    expect(chef_run).to include_recipe 'yum'
  end

  it 'should include the yum epel recipe' do
    expect(chef_run).to include_recipe 'yum-epel'
  end

  it 'should include the selinux::disable recipe' do
    expect(chef_run).to include_recipe 'selinux::disabled'
  end
end

describe 'Ubuntu setup' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(
      platform: 'ubuntu',
      version:  '12.04'
      )
    runner.converge('guest-agent::ovirt_repo')
  end
  it 'should include the apt recipe' do
    expect(chef_run).to include_recipe 'apt::default'
  end
end
