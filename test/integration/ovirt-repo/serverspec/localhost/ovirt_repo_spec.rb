require 'spec_helper'

# Required by serverspec
set :backend, :exec

# In CentOS 7.x the package name is ovirt-guest-agent-common
if os[:family] == 'redhat' && os[:release].to_i == 7
  package_name = 'ovirt-guest-agent-common'
else
  package_name = 'ovirt-guest-agent'
end

if os[:family] == 'redhat'
  describe 'RedHat/CentOS' do
    # Old RedHat/CentOS Release selinux disabled is enabled without reboot
    if %w(6.4).include?(os[:release])
      describe selinux do
        it { should be_disabled }
      end
    # New RedHat/CentOS Release must be rebooted before disabled is enabled
    else
      describe command 'getenforce | egrep \'(Disabled|Permissive)\'' do
        its(:exit_status) { should eq 0 }
      end
      describe file '/etc/selinux/config' do
        its(:content) { should match '^SELINUX=disabled' }
      end
    end
    describe yumrepo('epel') do
      it { should exist }
      it { should be_enabled }
    end
  end
end

if os[:family] == 'ubuntu'
  describe 'Ubuntu' do
    describe file('/etc/apt/sources.list.d/ovirt-guest-agent.list') do
      it { should be_file }
      it { should contain 'http://download.opensuse.org/repositories/home:' }
    end
  end
end

describe package package_name do
  it { should be_installed }
end

describe service 'ovirt-guest-agent' do
  it { should be_enabled }
end
