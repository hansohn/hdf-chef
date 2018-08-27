#
# Cookbook:: hdf-chef
# Recipe:: nifi_user
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

# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create nifi user
if node['hw']['nifi']['user']['name'] != 'root'
  user 'create_nifi_user' do
    username    node['hw']['nifi']['user']['name']
    home        node['hw']['nifi']['user']['home']
    shell       node['hw']['nifi']['user']['shell']
    uid         node['hw']['nifi']['user']['uid']
    group       node['hw']['hadoop']['common']['group']['name']
    manage_home true
    action      :create
  end
end

# create nifi group
group 'create_hadoop_group' do
  group_name  node['hw']['nifi']['group']['name']
  gid         node['hw']['nifi']['group']['gid']
  members     node['hw']['nifi']['user']['name']
  action      :create
end
