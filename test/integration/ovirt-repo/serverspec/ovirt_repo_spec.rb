require 'serverspec'

# Required by serverspec
set :backend, :exec

if os[:family] == 'redhat'

  describe 'RedHat/CentOS options' do
    describe selinux do
      it { should be_disabled }
    end
    describe yumrepo('epel') do
      it { should exist }
      it { should be_enabled }
    end
  end

elsif os[:family] == 'ubuntu'

  describe 'Ubuntu options' do
    describe file('/etc/apt/sources.list.d/ovirt-guest-agent.list') do
      it { should be_file }
      it { should contain 'http://download.opensuse.org/repositories/home:' }
    end
  end
end

describe package('ovirt-guest-agent') do
  it { should be_installed }
end

describe service('ovirt-guest-agent') do
  it { should be_enabled }
end
