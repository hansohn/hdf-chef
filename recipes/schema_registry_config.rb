#
# Cookbook:: hdf-chef
# Recipe:: schema_registry_config
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# install packages
package 'install_mysql-connector-java' do
  package_name 'mysql-connector-java'
  action :install
end
