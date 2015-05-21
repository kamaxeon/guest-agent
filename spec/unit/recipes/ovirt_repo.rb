require 'chefspec'

describe 'guest-agent::ovirt_repo' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  
  it 'install ovirt-guest-agent package' do
    expect(chef_run).to install_package('ovirt-guest-agent')
  end

  it 'enable ovirt-guest-agent service' do
    expect(chef_run).to enable_service('ovirt-guest-agent')
  end
end
