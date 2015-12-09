#---------------------------------------------------------------------------------------------------------------
# Author: Gowrish.Mallipattana
#
# Install php
#
#---------------------------------------------------------------------------------------------------------------

# Install httpd software - by calling yum specifically
#bash 'install httpd' do
# user "root"
#  code <<-EOH
#    yum -y install httpd > #{node[:httpdInstallLog]} 2>> #{node[:httpdInstallLog]}
#  EOH
#end

# Install httpd by using chef rerouce 'package'
package 'Install PHP' do
    package_name 'php'
end

package 'Install PHP-MYSQL' do
    package_name 'php-mysql'
end

# From http://www.if-not-true-then-false.com/2010/install-apache-php-on-fedora-centos-red-hat-rhel/comment-page-1/
bash 'enable remi yum repository' do
  user "root"
  code <<-EOH 
    rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
    yum --enablerepo=remi install php-mysqlnd
  EOH
end

bash 'verify - list php modules installed' do
  user "root"
  code <<-EOH
    php -m >> #{node[:phpInstallLog]} 2>> #{node[:phpInstallLog]}
  EOH
end
