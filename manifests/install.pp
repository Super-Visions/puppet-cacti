# Class: cacti::install
#
# Requires:
#   class apache::php
#   class mysql::server
#
#
#
#   - This class should not be called directly.      -
#   - To install cacti please call class 'cacti'     -
#
#
class cacti::install
(
  $db_name        = 'cacti',
  $db_user        = 'cacti',
  $db_pass        = 'cacti',
  $install_spine  = true

) inherits cacti::params {

  include apache::mod::php

  package { $cacti:
  		ensure => installed,
  } # package
  
  $_db_sql = [
    '/usr/share/doc/cacti-0.8.8b/cacti.sql',
    $cacti_config_sql,
  ]
  $_db_require = [
    Package[$cacti],
    File[$cacti_config_sql],
  ]

  if $install_spine {
    class {"cacti::spine" :
      db_name       => $db_name,
      require  => [ Package[$cacti] ];
    }
    
    $db_sql = concat( $_db_sql, $spine_config_sql )
    $db_require = concat( $_db_require, File[$spine_config_sql] )
    
  } else {
    $db_sql = $_db_sql
    $db_require = $_db_require
  }
  
  mysql::db { $db_name:
    user     =>  $db_user,
    password =>  $db_pass,
    sql      =>  $db_sql,
    require   => $db_require,
  }  # mysql::db

} # class cacti::install
