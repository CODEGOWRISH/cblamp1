#---------------------------------------------------------------------------------------------------------------
#
# Install php
#
#---------------------------------------------------------------------------------------------------------------

# Install prerequisite packages by using chef resource 'package'
package 'Install libxml2-devel' do
    package_name 'libxml2-devel'
end

# Install PHP by using zip download and build with make
remote_file '/tmp/php.gz' do
  source 'http://in1.php.net/get/php-5.6.16.tar.gz/from/this/mirror'
  action :create
end

bash 'install php with make' do
  user "root"
  code <<-EOH 
    cd /tmp
    phpfolder=`tar tvf php.gz|head -1 |awk '{print $6}' |cut -d\/ -f1`
    echo $phpfolder > /tmp/php-dirname.out 2>> /tmp/php-dirname.out
    tar xvfp php.gz
    cd $phpfolder
    echo "inside - " `pwd` >> /tmp/php-dirname.out
    ./configure > /tmp/php-configure.out 2>> /tmp/php-configure.out
    make > /tmp/php-make.out 2>> /tmp/php-make.out
    make test > /tmp/php-make-test.out 2>> /tmp/php-make-test.out
    make install > /tmp/php-make-install.out 2>> /tmp/php-make-install.out
  EOH
end

#  THE FOLLOWING WILL END UP INSTLLING AN OLDER VERSION
# Install PHP by using chef resource 'package'
#package 'Install PHP' do
#    package_name 'php'
#end
#
#package 'Install PHP-MYSQL' do
#    package_name 'php-mysql'
#end

# From http://www.if-not-true-then-false.com/2010/install-apache-php-on-fedora-centos-red-hat-rhel/comment-page-1/
#bash 'enable remi yum repository' do
#  user "root"
#  code <<-EOH 
#    rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
#    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
#    yum --enablerepo=remi install php-mysqlnd
#  EOH
#end

#bash 'verify - list php modules installed' do
#  user "root"
#  code <<-EOH
#    php -m >> #{node[:phpInstallLog]} 2>> #{node[:phpInstallLog]}
#  EOH
#end
