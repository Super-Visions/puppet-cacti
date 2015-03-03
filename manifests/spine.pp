# Class: cacti::spine
#
# This module installs spine
# http://www.cacti.net/
#
# Requires:
#   class cacti
#
class cacti::spine
(
  $db_name  = 'cacti'

) inherits cacti::params {

  package {
    $spine:
      require => [ Package[$cacti] ],
  } #package

  file {
    $spine_conf:
      source  => $spine_conf_src,
      require => Package[$spine];
    $spine_config_sql:
      source  => $spine_config_sql_src,
      require => Package[$spine];
  } # file

} #class cacti::spine
