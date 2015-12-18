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

    cat #{node[:httpdConfigFile]} | sed 's/^Listen 80/Listen 50000' > #{node[:httpdConfigFile]}.tmp
    mv #{node[:httpdConfigFile]}.tmp #{node[:httpdConfigFile]}

  EOH
end

# Restart httpd service
bash 'restart httpd' do
  user "root"
  code <<-EOH
    echo INFO - Restarting httpd `date` >> #{node[:httpdConfigLog]} 2>> #{node[:httpdConfigLog]}
    service httpd restart >> #{node[:httpdConfigLog]} 2>> #{node[:httpdConfigLog]}
  EOH
end

