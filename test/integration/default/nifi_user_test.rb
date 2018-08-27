# # encoding: utf-8

# Inspec test for recipe hdp-chef::nifi_user

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::nifi_user' do
  title 'Testing nifi user'

  describe group('hadoop') do
    it { should exist }
    its('gid') { should eq 10010 }
  end

  describe group('nifi') do
    it { should exist }
    its('gid') { should eq 10011 }
  end

  describe user('nifi') do
    it { should exist }
    its('uid') { should eq 15027 }
    its('home') { should eq '/home/nifi' }
    its('shell') { should eq '/bin/bash' }
    its('group') { should eq 'hadoop' }
  end
end
