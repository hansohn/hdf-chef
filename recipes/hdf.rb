#
# Cookbook Name:: hdp-chef
# Recipe:: hdf
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# install hdp repo
include_recipe "#{cookbook_name}::repo_hdf"

# config hdp applications

# install hortonworks data flow
include_recipe "#{cookbook_name}::hdf_install"
include_recipe "#{cookbook_name}::hdf_config"

# add hdp cluster files
include_recipe "#{cookbook_name}::hdf_cluster"
