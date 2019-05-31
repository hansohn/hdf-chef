name 'hdf-chef'
maintainer 'Ryan Hansohn'
maintainer_email 'info@imnorobot.com'
license 'MIT'
description 'Installs/Configures hdf-chef'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'
chef_version '>= 12.14' if respond_to?(:chef_version)
source_url 'https://github.com/hansohn/hdf-chef' if respond_to?(:source_url)
issues_url 'https://github.com/hansohn/hdf-chef/issues' if respond_to?(:issues_url)

supports 'centos', '>= 7.0'

depends 'ambari-chef'
depends 'hostsfile'
depends 'java-chef'
depends 'ulimit'
