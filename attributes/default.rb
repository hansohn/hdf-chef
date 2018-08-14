# -- PYTHON --
default['python']['python2']['packages'] = ['python']

# -- JAVA --
default['java']['install_from'] = 'oracle_source'
default['java']['install_version'] = 'jdk-8u181-linux-x64'

# -- AMBARI CLUSTER --
default['hw']['cluster']['name'] = 'hdf_demo'
default['hw']['cluster']['blueprint_name'] = 'hdf_demo_3.2.0_blueprint'
default['hw']['cluster']['blueprint_file'] = 'hdf_demo_3.2.0_blueprint.json'
default['hw']['cluster']['hostmapping_file'] = 'hdf_demo_3.2.0_hostmapping.json'

# -- AMBARI --
override['hw']['ambari']['version'] = '2.7.0'
default['hw']['ambari']['server']['setup']['db']['databasehost'] = 'localhost'
default['hw']['ambari']['server']['setup']['db']['databaseport'] = '5432'
default['hw']['ambari']['server']['setup']['db']['databasepassword'] = 'bigdata'
default['hw']['ambari']['server']['setup']['security']['setup-truststore'] = 'false'
default['hw']['ambari']['server']['config']['ambari.properties']['ambari.ldap.isConfigured'] = 'false'
default['hw']['ambari']['server']['config']['ambari.properties']['api.ssl'] = 'false'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.bindAnonymously'] = 'false'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.dnAttribute'] = 'dn'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.groupMembershipAttr'] = 'memberUid'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.groupNamingAttr'] = 'cn'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.groupObjectClass'] = 'posixgroup'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.managerPassword'] = '/etc/ambari-server/conf/ldap-password.dat'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.referral'] = 'follow'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.usernameAttribute'] = 'uid'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.userObjectClass'] = 'person'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.useSSL'] = 'true'
default['hw']['ambari']['server']['config']['ambari.properties']['client.api.port'] = '8080'
default['hw']['ambari']['server']['config']['ambari.properties']['client.api.ssl.cert_name'] = 'https.crt'
default['hw']['ambari']['server']['config']['ambari.properties']['client.api.ssl.key_name'] = 'https.key'
default['hw']['ambari']['server']['config']['ambari.properties']['client.api.ssl.port'] = '8443'
default['hw']['ambari']['server']['config']['ambari.properties']['gpl.license.accepted'] = 'true'
default['hw']['ambari']['server']['config']['ambari.properties']['security.server.two_way_ssl'] = 'false'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.connection-pool'] = 'internal'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.database_name'] = 'ambari'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.database'] = 'postgres'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.driver'] = 'org.postgresql.Driver'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.hostname'] = 'localhost'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.port'] = 5432
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.postgres.schema'] = 'ambari'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.rca.driver'] = 'org.postgresql.Driver'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.rca.url'] = 'jdbc:postgresql://localhost:5432/ambari'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.rca.user.name'] = 'ambari'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.rca.user.passwd'] = '/etc/ambari-server/conf/password.dat'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.url'] = 'jdbc:postgresql://localhost:5432/ambari'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.user.name'] = 'ambari'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.user.passwd'] = '/etc/ambari-server/conf/password.dat'
default['hw']['ambari']['server']['config']['ambari.properties']['ssl.trustStore.password'] = 'changeit'
default['hw']['ambari']['server']['config']['ambari.properties']['ssl.trustStore.path'] = '/var/lib/ambari-server/keys/keystore.jks'
default['hw']['ambari']['server']['config']['ambari.properties']['ssl.trustStore.type'] = 'jks'
default['hw']['ambari']['server']['crypto']['ca'] = '/etc/pki/ca-trust/source/anchors/ca.crt'
default['hw']['ambari']['server']['crypto']['https_cert'] = "/etc/pki/tls/certs/#{node['fqdn']}.crt"
default['hw']['ambari']['server']['crypto']['https_key'] = "/etc/pki/tls/private/#{node['fqdn']}.key"
default['hw']['ambari']['server']['crypto']['https_key_pass'] = 'changeit'
default['hw']['ambari']['server']['crypto']['https_keystore_p12'] = "/etc/pki/tls/certs/#{node['fqdn']}.p12"
default['hw']['ambari']['server']['crypto']['https_keystore_jks'] = "/etc/pki/tls/certs/#{node['fqdn']}.jks"
default['hw']['ambari']['server']['crypto']['ldap_pass'] = 'changeit'
default['hw']['ambari']['server']['crypto']['truststore_jks'] = "/etc/pki/tls/certs/#{node['fqdn']}.jks"
default['hw']['ambari']['server']['crypto']['truststore_pass'] = 'changeit'
default['hw']['ambari']['server']['user']['name'] = 'ambari-server'
default['hw']['ambari']['server']['user']['uid'] = '15010'
default['hw']['ambari']['server']['user']['home'] = '/var/lib/ambari-server'
default['hw']['ambari']['server']['user']['shell'] = '/bin/bash'
default['hw']['ambari']['agent']['setup']['security']['setup-truststore'] = 'false'
default['hw']['ambari']['agent']['config']['ambari-agent.ini']['keysdir'] = '/var/lib/ambari-agent/keys'
default['hw']['ambari']['agent']['crypto']['cert'] = "/etc/pki/tls/certs/#{node['fqdn']}.crt"
default['hw']['ambari']['agent']['crypto']['key'] = "/etc/pki/tls/private/#{node['fqdn']}.key"
default['hw']['ambari']['agent']['crypto']['ca'] = '/etc/pki/ca-trust/source/anchors/ca.crt'
default['hw']['ambari']['agent']['crypto']['truststore_jks'] = "/etc/pki/tls/certs/#{node['fqdn']}.jks"
default['hw']['ambari']['agent']['user']['name'] = 'ambari-agent'
default['hw']['ambari']['agent']['user']['home'] = '/var/lib/ambari-agent'
default['hw']['ambari']['agent']['user']['shell'] = '/bin/bash'
default['hw']['ambari']['agent']['user']['uid'] = '15011'
case node.chef_environment
when 'production'
  default['hw']['ambari']['server']['config']['ambari.properties']['host_cname'] = 'ambari.prd.domain.local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.baseDn'] = 'dc=prd,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.managerDn'] = 'uid=manager,cn=users,cn=accounts,dc=prd,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.primaryUrl'] = 'ldap-server-01.prd.domain.local:636'
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_groups'] = ['prd_user_group']
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_users'] = ['prd_user']
when 'staging'
  default['hw']['ambari']['server']['config']['ambari.properties']['host_cname'] = 'ambari.stg.domain.local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.baseDn'] = 'dc=stg,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.managerDn'] = 'uid=manager,cn=users,cn=accounts,dc=stg,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.primaryUrl'] = 'ldap-server-01.stg.domain.local:636'
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_groups'] = ['stg_user_group']
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_users'] = ['stg_user']
else
  default['hw']['ambari']['server']['config']['ambari.properties']['host_cname'] = 'ambari.dev.domain.local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.baseDn'] = 'dc=dev,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.managerDn'] = 'uid=manager,cn=users,cn=accounts,dc=dev,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.primaryUrl'] = 'ldap-server-01.dev.domain.local:636'
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_groups'] = ['dev_user_group']
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_users'] = ['dev_user']
end

# -- HORTONWORKS HDF --
default['hw']['hdf']['version'] = '3.2.0'
# 2.1.1
default['hw']['hdf']['2.1.1']['version_full'] = '2.1.1.0-2'
default['hw']['hdf']['2.1.1']['repo'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.1.0/hdf.repo"
default['hw']['hdf']['2.1.1']['mgmt_pack']['url'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.1.0-2.tar.gz"
default['hw']['hdf']['2.1.1']['mgmt_pack']['checksum'] = '1f85395a63573ef7b3ff8cbbb6822b1f46615383c0219ac0064e0739b8634591'
# 2.1.2
default['hw']['hdf']['2.1.2']['version_full'] = '2.1.2.0-10'
default['hw']['hdf']['2.1.2']['repo'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.2.0/hdf.repo"
default['hw']['hdf']['2.1.2']['mgmt_pack']['url'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.2.0-10.tar.gz"
default['hw']['hdf']['2.1.2']['mgmt_pack']['checksum'] = 'c3705419c0ca53935bb8edb13cb6de35214f18d37f8d7aa03890ea6574caf7e6'
# 2.1.4
default['hw']['hdf']['2.1.4']['version_full'] = '2.1.4.0-5'
default['hw']['hdf']['2.1.4']['repo'] =	"http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.4.0/hdf.repo"
default['hw']['hdf']['2.1.4']['mgmt_pack']['url'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.4.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.4.0-5.tar.gz"
default['hw']['hdf']['2.1.4']['mgmt_pack']['checksum'] = 'f44bccfe8fc9e0e6729e78520f312e41cf4a6121470076c22aa1d84295dbf6bb'
# 3.1.2
default['hw']['hdf']['3.1.2']['version_full'] = '3.1.2.0-7'
default['hw']['hdf']['3.1.2']['repo'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.1.2.0/hdf.repo"
default['hw']['hdf']['3.1.2']['mgmt_pack']['url'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.1.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.1.2.0-7.tar.gz"
default['hw']['hdf']['3.1.2']['mgmt_pack']['checksum'] = 'f7bf7469cf4152dacd517916a0a93936ed1baf3328efa232c6e8f0894af77fe0'
# 3.2.0
default['hw']['hdf']['3.2.0']['version_full'] = '3.2.0.0-520'
default['hw']['hdf']['3.2.0']['repo'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.2.0.0/hdf.repo"
default['hw']['hdf']['3.2.0']['mgmt_pack']['url'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/3.x/updates/3.2.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.2.0.0-520.tar.gz"
default['hw']['hdf']['3.2.0']['mgmt_pack']['checksum'] = '89472d3e969a7a3117c120b15433f18fd1963c81aaa87bc5ccf88e7cf0d80b6e'

# hdf
default['hw']['nifi']['config']['nifi-ambari-config']['nifi.security.encrypt.configuration.password'] = 'Welcome12345'
default['hw']['nifi']['config']['nifi-ambari-config']['nifi.sensitive.props.key'] = 'Welcome12345'
default['hw']['nifi']['config']['nifi-ambari-ssl-config']['nifi.toolkit.tls.token'] = 'changeit'
default['hw']['zookeeper']['config']['zoo.cfg']['dataDir'] = '/hadoop/zookeeper'
default['hw']['zookeeper']['user']['name'] = 'zookeeper'
default['hw']['zookeeper']['user']['home'] = '/home/zookeeper'
default['hw']['zookeeper']['user']['shell'] = '/bin/bash'
default['hw']['zookeeper']['user']['uid'] = '15025'
