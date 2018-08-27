# # encoding: utf-8

# Inspec test for recipe hdp-chef::zookeeper_user

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::zookeeper_user' do
  title 'Testing zookeeper user'

  describe group('hadoop') do
    it { should exist }
    its('gid') { should eq 10010 }
  end

  describe user('zookeeper') do
    it { should exist }
    its('uid') { should eq 15025 }
    its('home') { should eq '/home/zookeeper' }
    its('shell') { should eq '/bin/bash' }
    its('group') { should eq 'hadoop' }
  end
end
