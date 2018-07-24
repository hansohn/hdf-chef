#
# Cookbook Name:: hdf-chef
# Recipe:: hdf_install
#
# The MIT License (MIT)
#
# Copyright:: 2018, Ryan Hansohn
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

hdf_mpack_source = -> { node['hw']['hdf'][node['hw']['hdf']['version']]['mgmt_pack']['url'] }
hdf_mpack_checksum = -> { node['hw']['hdf'][node['hw']['hdf']['version']]['mgmt_pack']['checksum'] }

# download hdf management pack
remote_file 'download_hdf_mgmt_pack' do
  path "/tmp/hdf-ambari-mpack-#{node['hw']['hdf']['version']}.tar.gz"
  source hdf_mpack_source.call
  checksum hdf_mpack_checksum.call
end

# backup ambari resources
bash 'backup_ambari_resources' do
  code 'cp -r /var/lib/ambari-server/resources /var/lib/ambari-server/resources.backup'
  action :nothing
  only_if { File.exist?('/var/lib/ambari-server/resources') }
end

# set ambari-server file permissions
bash 'set_ambari-server_file_permissions' do
  code "chown -R #{node['hw']['ambari']['server']['user']['name']}:root /var/lib/ambari-server"
  action :nothing
end

# restart ambari server
service 'ambari-server_service' do
  service_name 'ambari-server.service'
  status_command "grep -q 'Ambari Server running' <(/etc/init.d/ambari-server status)"
  action :nothing
end

# verify ambari server is up and responding
bash 'verify_ambari_server_is_responding' do
  code <<-EOF
    i=1
    while ! grep -q 8080 <(netstat -anop) && [ $i -lt 12 ]; do
      i=$((i+1))
      sleep 5
    done
  EOF
  action :nothing
end

# install hdf managemnet pack
bash 'install_hdf_mgmt_pack' do
  code <<-EOF
    yes | ambari-server install-mpack \
      --mpack=/tmp/hdf-ambari-mpack-#{node['hw']['hdf']['version']}.tar.gz \
      --purge \
      --verbose
  EOF
  only_if { File.exist?("/tmp/hdf-ambari-mpack-#{node['hw']['hdf']['version']}.tar.gz") }
  not_if  { Dir["/var/lib/ambari-server/resources/mpacks/hdf-ambari-mpack-#{node['hw']['hdf']['version']}.*"].any? }
  notifies :run, 'bash[backup_ambari_resources]', :before
  notifies :run, 'bash[set_ambari-server_file_permissions]', :immediately
  notifies :restart, 'service[ambari-server_service]', :immediately
  notifies :run, 'bash[verify_ambari_server_is_responding]', :immediately
end
