bigfix
------

This is the bigfix module. It is designed to install and configure bigfix agents and relays. Unfortunately at this time due to the tight control that IBM keeps on DB2 distribution I'm unable to offer a server module. I do plan to look into it further in the future and hope to find some way of making it happen.

License
-------

Apache License, Version 2.0

Contact
-------

tms@eecs.berkeley.edu

Support
-------

If something doesn't work, let me know.

#### Table of Contents


1. [Module Description - What the module does and why it is useful](#module-description)
1. [Setup - The basics of getting started with puppet-bigfix](#setup)
    * [What bigfix affects](#what-bigfix-affects)
    * [Beginning with bigfix](#beginning-with-bigfix)
1. [Usage - Configuration options and additional functionality](#usage)
    * [Install and Configure a Client](#install-and-configure-a-client)
    * [Hiera Configuration](#hiera-configuration)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Module Description

The bigfix module lets you use Puppet to manage IBM Big Fix package, service and config files.

Big Fix is a product from IBM that allows license audits, patches and other management related operations for Windows and *NIX based servers.

## Setup

### What bigfix affects

* Installation of BigFix agent via native package management
* Installation of site-specific ActionSite file (provided by your BigFix administrator)
* Configuration of besagent.config file (ini style settings)


### Beginning with bigfix

To use the bigfix module with default parameters, declare the `bigfix::client` class.

```puppet
class {'bigfix::client':
  license_file   => '/path/to/your/actionsite.afxr',
}
```


## Usage

### Install and Configure a Client

### Hiera Configuration

Instead of specifying your parameters directly as resources, you can instead just include the `bigfix::client` class, which will pick up the values automatically from hiera.

```yaml


bigfix::client::config:
  'Software\BigFix\EnterpriseClient\Settings\Client\__Relay_Control_Server1':
    'first':
      setting: 'value'
      value: 'http://bigfix1.example.com:52311'
    'second':
      ensure: absent
      value: 'Wed,%2004%20Apr%202018%2014:21:22%20-0400'
  'Software\BigFix\EnterpriseClient\Settings\Client\__RelaySelect_Automatic':
    'first':
      setting: 'value'
      value: '1'
    'second':
      ensure: absent
      setting: 'effective_date
```


## Reference

### Classes

#### Public Classes

* [`bigfix`](#class-bigfix)
* [`bigfix::clients`](#class-bigfixclient)

#### Private Classes

* `bigfix::params`: Provides defaults for the bigfix module parameters.

### Defined Types

* None

#### Class: `bigfix`

Main class, includes all other classes.

##### Parameters

All parameters are optional unless specified.

* `confs`: Creates new `bigfix::conf` resources. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createresources). Default: {}.

* `keys`: Creates new `bigfix::key` resources. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createresources). Default: {}.

* `ppas`: Creates new `bigfix::ppa` resources. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createresources). Default: {}.

* `proxy`: Configures Apt to connect to a proxy server. Valid options: a hash made up from the following keys:

  * `host`: Specifies a proxy host to be stored in `/etc/bigfix/bigfix.conf.d/01proxy`. Valid options: a string containing a hostname. Default: undef.

  * `port`: Specifies a proxy port to be stored in `/etc/bigfix/bigfix.conf.d/01proxy`. Valid options: an integer containing a port number. Default: 8080.

  * `https`: Specifies whether to enable https proxies. Valid options: `true` and `false`. Default: `false`.

  * `ensure`: Optional parameter. Valid options: 'file', 'present', and 'absent'. Default: `undef`. Prefer 'file' over 'present'.
  
  * `direct`: Specifies whether or not to use a 'DIRECT' https proxy if http proxy is used but https is not. Valid options: `true` and `false`. Default: `false`.

* `purge`: Specifies whether to purge any existing settings that aren't managed by Puppet. Valid options: a hash made up from the following keys:

  * `sources.list`: Specifies whether to purge any unmanaged entries from `sources.list`. Valid options: `true` and `false`. Default: `false`.

  * `sources.list.d`: Specifies whether to purge any unmanaged entries from `sources.list.d`. Valid options: `true` and `false`. Default: `false`.

  * `preferences`: Specifies whether to purge any unmanaged entries from `preferences`. Valid options: `true` and `false`. Default: `false`.

  * `preferences.d`: Specifies whether to purge any unmanaged entries from `preferences.d`. Valid options: `true` and `false`. Default: `false`.

* `settings`: Creates new `bigfix::setting` resources. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createresources). Default: {}.

* `sources`: Creates new `bigfix::source` resources. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createresources). Default: {}.

#### Class: `bigfix::client`

Main class, includes all other classes.

##### Parameters

All parameters are optional unless specified.

* `confs`: Creates new `bigfix::conf` resources. Valid options: a hash to be passed to the [`create_resources` function](https://docs.puppetlabs.com/references/latest/function.html#createresources). Default: {}.


## Limitations

This module is tested only on RHEL 5, 6 and 7 on i386, x86_64 and s390x architectures.  The module is architecture agnostic (to the best of my knowledge).


## Development

Puppet modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. We can't access the huge number of platforms and myriad hardware, software, and deployment configurations that Puppet is intended to serve. We want to keep it as easy as possible to contribute changes so that our modules work in your environment. There are a few guidelines that we need contributors to follow so that we can have a chance of keeping on top of things.

For more information, see our [module contribution guide.](https://docs.puppetlabs.com/forge/contributing.html)

To see who's already involved, see the [list of contributors.](https://github.com/tscopp/puppet-bigfix/graphs/contributors)
