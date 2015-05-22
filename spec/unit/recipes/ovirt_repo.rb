require 'chefspec'
require 'chefspec/berkshelf'

describe 'guest-agent::ovirt_repo' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }
  # let(:chef_run) { ChefSpec::SoloRunner.new('..').converge(described_recipe) }

  ChefSpec::SoloRunner.new(cookbook_path: '/home/isra/.berkshelf/cookbooks/')
  
  it 'install ovirt-guest-agent package' do
    expect(chef_run).to install_package('ovirt-guest-agent')
  end

  it 'enable ovirt-guest-agent service' do
    expect(chef_run).to enable_service('ovirt-guest-agent')
  end
end
