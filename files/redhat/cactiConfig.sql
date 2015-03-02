-- ************************** WARNING ********************************
-- File Managed by Puppet
-- Any changes to this file configuration should be done trough puppet
-- other wise configuration will be overwriten on te next puppet pass.
-- *******************************************************************

replace into settings (name,value) values ('path_rrdtool','/usr/bin/rrdtool');
replace into settings (name,value) values ('path_php_binary','/usr/bin/php');
replace into settings (name,value) values ('path_snmpwalk','/usr/bin/snmpwalk');
replace into settings (name,value) values ('path_snmpget','/usr/bin/snmpget');
replace into settings (name,value) values ('path_snmpbulkwalk','/usr/bin/snmpbulkwalk');
replace into settings (name,value) values ('path_snmpgetnext','/usr/bin/snmpgetnext');
replace into settings (name,value) values ('path_cactilog','/var/log/cacti/cacti.log');
replace into settings (name,value) values ('snmp_version','net-snmp');
replace into settings (name,value) values ('rrdtool_version','rrd-1.3.x');
UPDATE version SET cacti='0.8.8b';