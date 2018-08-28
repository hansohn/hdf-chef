#
# Cookbook Name:: hdf-chef
# Recipe:: hdf_config
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

# include recipe(s)
include_recipe 'ulimit::default'

# set limits
user_ulimit '*' do
  filehandle_soft_limit 50000
  filehandle_hard_limit 50000
  process_soft_limit 10000
  process_hard_limit 10000
end

# widen the port range used for outgoing connections
sysctl 'net.ipv4.ip_local_port_range' do
  key 'net.ipv4.ip_local_port_range'
  value '10000 65000'
  action :apply
end

# wait a maximum of 1 seconds in the TIME_WAIT state after a FIN, to handle
# any remaining packets in the network.
if node['virtualization']['system'] != 'docker'
  bash 'load_ip_conntrack' do
    code 'modprobe ip_conntrack'
    action :run
  end
end

sysctl 'net.netfilter.nf_conntrack_tcp_timeout_time_wait' do
  key 'net.netfilter.nf_conntrack_tcp_timeout_time_wait'
  value 1
  action :apply
end
