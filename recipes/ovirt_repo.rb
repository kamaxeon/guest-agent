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
  include_recipe 'yum'
  include_recipe 'yum-epel'
  include_recipe 'selinux::disabled'
end

package 'ovirt-guest-agent' do
  action :install
end

service 'ovirt-guest-agent' do
  action [:enable, :start]
  #action [:enable]
end

