#
# Cookbook Name:: hdf-chef
# Recipe:: hdf_cluster
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

hdf_version = -> { node['hw']['hdf']['version'] }
hdf_version_full = -> { node['hw']['hdf'][hdf_version.call]['version_full'] }
hdf_vdf = -> { node['hw']['hdf'][hdf_version.call]['vdf'] }

# hdf-cluster: create clusters directory
directory 'make_/var/lib/ambari-clusters' do
  path '/var/lib/ambari-clusters'
  recursive true
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
end

# hdf-cluster: add version definition file to cluster dir
remote_file "create_/var/lib/ambari-clusters/HDF-#{hdf_version_full.call}.xml" do
  source hdf_vdf.call
  path "/var/lib/ambari-clusters/HDF-#{hdf_version_full.call}.xml"
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
  action :create_if_missing
end

# hdf-cluster: add version definition post to cluster dir
template "create_/var/lib/ambari-clusters/#{node['hw']['cluster']['version_definition_file']}" do
  path "/var/lib/ambari-clusters/#{node['hw']['cluster']['version_definition_file']}"
  source 'version_definition_file.json.erb'
  variables(
    'version_full' => hdf_version_full.call
  )
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
end

# hdf-cluster: add blueprint to cluster dir
template "create_/var/lib/ambari-clusters/#{node['hw']['cluster']['blueprint_file']}" do
  path "/var/lib/ambari-clusters/#{node['hw']['cluster']['blueprint_file']}"
  source "#{node['hw']['cluster']['blueprint_file']}.erb"
  sensitive true
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
end

# hdf-cluster: add hostmapping to cluster dir
template "create_/var/lib/ambari-clusters/#{node['hw']['cluster']['hostmapping_file']}" do
  path "/var/lib/ambari-clusters/#{node['hw']['cluster']['hostmapping_file']}"
  source "#{node['hw']['cluster']['hostmapping_file']}.erb"
  sensitive true
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
end
