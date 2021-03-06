# # encoding: utf-8

# Inspec test for recipe hdf-chef::hdf_cluster

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdf-chef::hdf_cluster' do
  title 'Testing hdf cluster installation'

  describe file('/var/lib/ambari-clusters') do
    it { should be_directory }
    its('owner') { should eq 'ambari-server' }
    its('group') { should eq 'root' }
  end

  describe file('/var/lib/ambari-clusters/hdf_demo_3.4.1.1_blueprint.json') do
    it { should be_file }
    its('owner') { should eq 'ambari-server' }
    its('group') { should eq 'root' }
  end

  describe file('/var/lib/ambari-clusters/hdf_demo_3.4.1.1_hostmapping.json') do
    it { should be_file }
    its('owner') { should eq 'ambari-server' }
    its('group') { should eq 'root' }
  end

  describe bash("curl -H 'X-Requested-By: ambari' -u admin:admin http://ambari-server:8080/api/v1/blueprints") do
    its('stdout') { should match /hdf_demo_3.4.1.1_blueprint/ }
    its('exit_status') { should eq 0 }
  end

  describe bash("curl -H 'X-Requested-By: ambari' -u admin:admin http://ambari-server:8080/api/v1/clusters/hdf_demo") do
    its('exit_status') { should eq 0 }
  end
end
