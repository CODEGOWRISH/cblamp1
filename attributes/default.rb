#                                                                                         
# Author: Gowrish.Mallipattana                                                            
#                                                                                         
# Attributes file default.rb for mysql installation                                      
#                                                                                         
#                                                                                         
 
# Common
default['clusterDir']    = '/var/lib/mysql-cluster'
default['dataDir']       = '/var/lib/mysql-cluster/data'
default['hostsFile']     = '/etc/hosts'
default['myCnfFile']     = '/etc/my.cnf'
default['configIniFile'] = '/var/lib/mysql-cluster/config.ini'
default['usrClusterDir'] = '/usr/mysql-cluster'

default['softwareFolder'] = '/vagrant'
default['serverRPM']      = 'MySQL-Cluster-server-advanced-7.4.8-1.el6.x86_64.rpm'
default['clientRPM']      = 'MySQL-Cluster-client-advanced-7.4.8-1.el6.x86_64.rpm'

default['serverInstallLog'] = '/tmp/mysql_server_install.log'
default['clientInstallLog'] = '/tmp/mysql_client_install.log'
default['httpdInstallLog']  = '/tmp/httpd_install.log'
default['phpInstallLog']    = '/tmp/php_install.log'

#{softwareFolder}/#{softwareBundle}

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