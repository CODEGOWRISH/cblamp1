#---------------------------------------------------------------------------------------------------------------
# Author: Gowrish.Mallipattana
#
# Config httpd
#
#---------------------------------------------------------------------------------------------------------------

# Configure httpd services
bash 'config httpd' do
 user "root"
  code <<-EOH

    timestamp=`date +%Y%m%d-%H%M%S`
    echo INFO - Backing up httpd config file `date` >> #{node[:httpdConfigLog]} 2>> #{node[:httpdConfigLog]} 
    cp #{node[:httpdConfigFile]} #{node[:httpdConfigFile]}-$timestamp

    cat #{node[:httpdConfigFile]} | sed 's/Listen 80/Listen 50000/g' > #{node[:httpdConfigFile]}.tmp
    cp #{node[:httpdConfigFile]}.tmp #{node[:httpdConfigFile]}

  EOH
end

# Restart httpd service
service 'httpd' do
  action [:restart]
end
