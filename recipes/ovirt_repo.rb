#
# Cookbook Name:: guest-agent
# Recipe:: ovirt
#
# Copyright (C) 2015 Israel Santana
#
# All rights reserved - Do Not Redistribute
#

case node['platform_family']
when 'debian'
  include_recipe 'apt'
  apt_repository 'ovirt-guest-agent' do
    uri node['guest-agent']['ovirt']['ubuntu']['repo']['url']
    components ['/']
    key node['guest-agent']['ovirt']['ubuntu']['repo']['key']
  end
when 'rhel'
  include_recipe 'selinux::disabled'
  include_recipe 'yum'
  include_recipe 'yum-epel'
  directory '/dev/virtio-ports' do
    action :create
    mode '0755'
  end
  file '/dev/virtio-ports/com.redhat.rhevm.vdsm' do
    action :create_if_missing
    mode '0777'
  end
end

package 'ovirt-guest-agent' do
  action :install
end

service 'ovirt-guest-agent' do
  action [:enable, :start]
end
