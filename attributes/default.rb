default['guest-agent']['ovirt']['ubuntu']['repo']['url'] =
  'http://download.opensuse.org/repositories/home' \
  ":/evilissimo:/ubuntu:/#{node['platform_version']}" \
  "/xUbuntu_#{node['platform_version']}/"

default['guest-agent']['ovirt']['ubuntu']['repo']['key'] =
  'http://download.opensuse.org/repositories/home:/evilissimo:/ubuntu:/' \
 "#{node['platform_version']}/xUbuntu_#{node['platform_version']}/Release.key"
