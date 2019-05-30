# # encoding: utf-8

# Inspec test for recipe hdf-chef::hdf_config

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdf-chef::hdf_config' do
  title 'Testing hdf config'

  describe kernel_parameter('net.ipv4.ip_local_port_range') do
    its('value') { should match /10000\t65000/ }
  end

  describe kernel_parameter('net.netfilter.nf_conntrack_tcp_timeout_time_wait') do
    its('value') { should eq 1 }
  end
end
