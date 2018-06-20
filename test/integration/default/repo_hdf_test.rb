# # encoding: utf-8

# Inspec test for recipe hdf-chef::repo_hdf

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdf-chef::repo_hdf' do
  title 'Testing Hortonworks HDF repos'

  describe yum.repo('HDF-3.1.2.0') do
    it { should exist }
    it { should be_enabled }
  end

  describe yum.repo('HDP-UTILS-1.1.0.22') do
    it { should exist }
    it { should be_enabled }
  end
end
