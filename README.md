# hdf-chef

[![Build Status](https://travis-ci.org/hansohn/hdf-chef.svg?branch=master)](https://travis-ci.org/hansohn/hdf-chef) [![GitHub tag](https://img.shields.io/github/tag/hansohn/hdf-chef.svg)](https://github.com/hansohn/hdf-chef)

This cookbook extends the [ambari-chef](https://github.com/hansohn/ambari-chef) cookbook to install [Hortonworks Data Flow](https://hortonworks.com/products/data-platforms/hdf/) and provision [NiFi](https://nifi.apache.org/) clusters using [Blueprints](https://cwiki.apache.org/confluence/display/AMBARI/Blueprints).

### Prerequsites

HDF requires [Ambari](https://ambari.apache.org/), [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html), and [Python](https://www.python.org/) as prerequisites for installation. These prerequisites can be fulfilled using recipes found in the [ambari-chef](https://github.com/hansohn/ambari-chef) cookbook or by any other means independently. You can include and customize these prerequisites by modifying the following.

```ruby
# -- INCLUDE COOKBOOKS --
# ambari-server
include 'ambari-chef::ambari_server_prerequisites'
include 'ambari-chef::ambari_server'

# ambari-agent
include `ambari-chef::ambari_agent_prerequisites`
include 'ambari-chef::ambari_agent'
```

```ruby
# -- INCLUDE ATTRIBUTES --
# python 2
override['python'] = {
  'python2' => { 
    'packages' => ['python'],
  },
}

# java 8
override['java'] = {
  'install_from' => 'amazon_source',
  'install_version' => 'jdk-8u212-linux-x64',
}
```

### Configuration

By default this cookbook installs HDF version ```3.4.1.1```. A different version of HDF can be specified for installation by overriding the version attribute.

```ruby
# hdf
override['hw']['hdf'] = {
  'version' => '3.4.1.1',
}
```

### Blueprints

Blueprints allow hdf clusters to be programmatically provisioned. A sample `hdf_demo` blueprint has been included with this cookbook contains core NiFi applications.

You can create your own blueprints and modify the following to push them out with this cookbook

```ruby
# -- INCLUDE ATTRIBUTES --
# hortonworks hdf cluster
override['hw']['hdf'] = {
  'version' => '3.4.1.1',
  'cluster' => {
    'name' => 'hdf_demo',
    'blueprint_name' => 'hdf_demo_3.4.1.1_blueprint',
    'blueprint_file' => 'hdf_demo_3.4.1.1_blueprint.json',
    'hostmapping_file' => 'hdf_demo_3.4.1.1_hostmapping.json',
  },
}
```

### Usage

To install HDF, include the `hdf` recipe in your run list. Unless independently handling the perquisites yourself, include the recipes provided by the `ambari-chef` cookbook as well.

```ruby
# include prerequisites
include 'ambari-chef::ambari_server_prerequisites'
include 'ambari-chef::ambari_server'

# include hdf
include 'hdf-chef::hdf'
include 'ambari-chef::ambari_cluster'
```

Once installed, log into Ambari at http://127.0.0.1:8080 using `admin` for both the username and password. The `hdf_demo` cluster will automatically provision using the included blueprint.

### Documentation

The following resources may be helpful to better understand HDF:

- [Apache Ambari](https://ambari.apache.org/)
- [Apache Ambari Blueprints](https://cwiki.apache.org/confluence/display/AMBARI/Blueprints)
- [Apache NiFi](https://nifi.apache.org/)
- [Hortonworks Documentation](https://docs.hortonworks.com/index.html)
- [Hortonworks Community](https://community.hortonworks.com/answers/index.html)
