#                                                                                         
# Author: Gowrish.Mallipattana                                                            
#                                                                                         
# Attributes file default.rb for mysql installation                                      
#                                                                                         
#                                                                                         
 
#-----------------------
# Unix and Machine/VM
#-----------------------

default['hostsFile']     = '/etc/hosts'
default['softwareFolder'] = '/vagrant'

# MySQL
default['clusterDir']    = '/var/lib/mysql-cluster'
default['dataDir']       = '/var/lib/mysql-cluster/data'

default['myCnfFile']     = '/etc/my.cnf'
default['configIniFile'] = '/var/lib/mysql-cluster/config.ini'
default['usrClusterDir'] = '/usr/mysql-cluster'

default['serverRPM']      = 'MySQL-Cluster-server-advanced-7.4.8-1.el6.x86_64.rpm'
default['clientRPM']      = 'MySQL-Cluster-client-advanced-7.4.8-1.el6.x86_64.rpm'

default['serverInstallLog'] = '/tmp/mysql_server_install.log'
default['clientInstallLog'] = '/tmp/mysql_client_install.log'

#---------------
# Apache HTTPD
#---------------
# http port for Apache - use 50000 series
default['httpd_http_port']  = '50000'

# https port for Apache - use 50500 series
default['httpd https_port'] = '50500'

default['httpdInstallLog']  = '/tmp/httpd_install.log'
default['httpdConfigLog']  = '/tmp/httpd_config.log'

default['httpdConfigFile']  = '/etc/httpd/conf/httpd.conf'
default['httpdConfigFileTemplate']  = 'httpd_conf.erb'

default['site1']['folder']  = '/var/www/sites/gowrishms.com'
default['site1']['htmlFolder']  = '/var/www/sites/gowrishms.com/html'
default['site1']['indexFile']  = '/var/www/sites/gowrishms.com/html/index.html'
default['site1']['indexFileTemplate']  = 'index1_html.erb'

default['site2']['folder']  = '/var/www/sites/gowrishdba.com'
default['site2']['htmlFolder']  = '/var/www/sites/gowrishdba.com/html'
default['site2']['indexFile']  = '/var/www/sites/gowrishdba.com/html/index.html'
default['site2']['indexFileTemplate']  = 'index2_html.erb'

#------
# PHP
#------
default['phpInstallLog']    = '/tmp/php_install.log'
default['phpConfigLog']    = '/tmp/php_Config.log'

#{softwareFolder}/#{softwareBundle}

#---------------------------------------
# Host Names and IP Addresses of Nodes
#---------------------------------------

# Node1                                                                                         
default['node1']['hostName']  = 'mysqln1'
default['node1']['ip']        = '192.168.65.31'

# Node2 (in json)                                                                                                                                                
default[:node2] = {
  :hostName => 'mysqln2',
  :ip => '192.168.65.32'
}

# webapp node (in json)                                                                                                                                                
default[:webapp1] = {
  :hostName => 'webapp1',
  :ip => '192.168.65.51'
}