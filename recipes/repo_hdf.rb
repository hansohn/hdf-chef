#
# Cookbook Name:: hdf-chef
# Recipe:: repo_hdf
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

# reload internal Chef yum cache
ruby_block 'yum_cache_reload' do
  block { Chef::Provider::Package::Yum::YumCache.instance.reload }
  action :nothing
end

hdf_repo = -> { node['hw']['hdf'][node['hw']['hdf']['version']]['repo'] }

# add hdf yum repo
remote_file 'hdf_yum_repo' do
  source hdf_repo.call
  path "/etc/yum.repos.d/hdf_#{node['hw']['hdf']['version']}.repo"
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
  notifies :run, 'ruby_block[yum_cache_reload]', :immediately
end
