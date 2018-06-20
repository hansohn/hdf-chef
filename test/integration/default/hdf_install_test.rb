# # encoding: utf-8

# Inspec test for recipe hdf-chef::hdf_install

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdf-chef::hdf_install' do
  title 'Testing hdf install installation'

  describe file('/tmp/hdf-ambari-mpack-3.1.2.tar.gz') do
    it { should be_file }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end

  describe file('/var/lib/ambari-server/resources.backup') do
    it { should be_directory }
    its('owner') { should eq 'ambari-server' }
    its('group') { should eq 'root' }
  end

  describe file('/var/lib/ambari-server/resources/mpacks/hdf-ambari-mpack-3.1.2.0-7') do
    it { should be_directory }
    its('owner') { should eq 'ambari-server' }
    its('group') { should eq 'root' }
  end

  describe service('ambari-server') do
    it { should be_running }
  end

  describe port(8080) do
    it { should be_listening }
  end
end
