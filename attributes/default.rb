# -- PYTHON --
override['python'] = {
  'python2' => {
    'packages' => ['python'],
  },
}

# -- JAVA --
override['java'] = {
  'install_from' => 'amazon_source',
  'install_version' => 'jdk-8u212-linux-x64',
}

# -- AMBARI --
override['hw']['ambari'] = {
  'version' => '2.7.3',
}

# -- HDF CLUSTER --
override['hw']['cluster'] = {
  'name' => 'hdf_demo',
  'blueprint_name' => 'hdf_demo_3.4.1.1_blueprint',
  'blueprint_file' => 'hdf_demo_3.4.1.1_blueprint.json',
  'hostmapping_file' => 'hdf_demo_3.4.1.1_hostmapping.json',
}

# -- HORTONWORKS HDF --
default['hw']['hdf'] = {
  'version' => '3.4.1.1',
  '2.1.1' => {
    'version_full' => '2.1.1.0-2',
    'vdf' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.1.0/HDF-2.1.1.0-2.xml",
    'repo' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.1.0/hdf.repo",
    'mgmt_pack' => {
      'url' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.1.0-2.tar.gz",
      'checksum' => '1f85395a63573ef7b3ff8cbbb6822b1f46615383c0219ac0064e0739b8634591',
    },
  },
  '2.1.2' => {
    'version_full' => '2.1.2.0-10',
    'vdf' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.2.0/HDF-2.1.2.0-10.xml",
    'repo' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.2.0/hdf.repo",
    'mgmt_pack' => {
      'url' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.2.0-10.tar.gz",
      'checksum' => 'c3705419c0ca53935bb8edb13cb6de35214f18d37f8d7aa03890ea6574caf7e6',
    },
  },
  '2.1.4' => {
    'version_full' => '2.1.4.0-5',
    'vdf' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.4.0/HDF-2.1.4.0-5.xml",
    'repo' =>	"http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.4.0/hdf.repo",
    'mgmt_pack' => {
      'url' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.4.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.4.0-5.tar.gz",
      'checksum' => 'f44bccfe8fc9e0e6729e78520f312e41cf4a6121470076c22aa1d84295dbf6bb',
    },
  },
  '3.1.2' => {
    'version_full' => '3.1.2.0-7',
    'vdf' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.1.2.0/HDF-3.1.2.0-7.xml",
    'repo' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.1.2.0/hdf.repo",
    'mgmt_pack' => {
      'url' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.1.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.1.2.0-7.tar.gz",
      'checksum' => 'f7bf7469cf4152dacd517916a0a93936ed1baf3328efa232c6e8f0894af77fe0',
    },
  },
  '3.2.0' => {
    'version_full' => '3.2.0.0-520',
    'vdf' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.2.0.0/HDF-3.2.0.0-520.xml",
    'repo' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.2.0.0/hdf.repo",
    'mgmt_pack' => {
      'url' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.2.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.2.0.0-520.tar.gz",
      'checksum' => '89472d3e969a7a3117c120b15433f18fd1963c81aaa87bc5ccf88e7cf0d80b6e',
    },
  },
  '3.4.1.1' => {
    'version_full' => '3.4.1.1-4',
    'vdf' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.4.1.1/HDF-3.4.1.1-4.xml",
    'repo' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.4.1.1/hdf.repo",
    'mgmt_pack' => {
      'url' => "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.4.1.1/tars/hdf_ambari_mp/hdf-ambari-mpack-3.4.1.1-4.tar.gz",
      'checksum' => '733172fd9a08831719ca81102ad00e218468c1d5cb39f8c55802898cac7587af',
    },
  },
}

# -- NIFI --
default['hw']['nifi'] = {
  'config' => {
    'nifi-ambari-config' => {
      'nifi.security.encrypt.configuration.password' => 'Welcome12345',
      'nifi.sensitive.props.key' => 'Welcome12345',
    },
    'nifi-ambari-ssl-config' => {
      'nifi.toolkit.tls.token' => 'changeit',
    },
  },
  'group' => {
    'name' => 'nifi',
    'gid' => '10011',
  },
  'user' => {
    'name' => 'nifi',
    'home' => '/home/nifi',
    'shell' => '/bin/bash',
    'uid' => '15027',
  },
}

# -- ZOOKEEPER --
default['hw']['zookeeper'] = {
  'config' => {
    'zoo.cfg' => {
      'dataDir' => '/hadoop/zookeeper',
    },
  },
  'user' => {
    'name' => 'zookeeper',
    'home' => '/home/zookeeper',
    'shell' => '/bin/bash',
    'uid' => '15025',
  },
}
