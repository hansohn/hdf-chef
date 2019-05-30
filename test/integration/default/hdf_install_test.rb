# # encoding: utf-8

# Inspec test for recipe hdf-chef::hdf_install

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdf-chef::hdf_install' do
  title 'Testing hdf install installation'

  describe file('/var/lib/ambari-server/resources/mpacks/hdf-ambari-mpack-3.4.1.1-4') do
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
