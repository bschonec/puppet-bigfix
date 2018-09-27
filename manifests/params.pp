# == Class: bigfix::params
#
#  This class manages parameters relating to the installation of the
#  bigfix agent and relay.
#
# === Parameters
#
# === Variables
#
# [*bigfix::client::version*]
#   The desired version of the client/relay packages (defaults to 9.1)
#
# === Authors
#
# Timothy Scoppetta (tms@eecs.berkeley.edu)
#
# === Copyright
#
# Copyright 2014 Timothy Scoppetta, unless otherwise noted.

class bigfix::params{

  $config_dir = '/var/opt/BESClient'
  $config_file = 'besclient.config'

  # The path to the BigFix besclient.conf file where BigFix servers/relays
  # send information to the client.  BigFix changes this file from underneath Puppet
  # so we must usin puppetlabs-inifile to manage it.
  $inifile_defaults = { 'path' => "${config_dir}/${config_file}" }

}
