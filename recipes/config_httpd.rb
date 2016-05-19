#---------------------------------------------------------------------------------------------------------------
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

    #cat #{node[:httpdConfigFile]} | sed 's/Listen 80/Listen 50001/g' > #{node[:httpdConfigFile]}.tmp
    #cp #{node[:httpdConfigFile]}.tmp #{node[:httpdConfigFile]}

    mkdir -p #{node['site1']['folder']}
    mkdir -p #{node['site1']['htmlFolder']}

    mkdir -p #{node['site2']['folder']}
    mkdir -p #{node['site2']['htmlFolder']}

  EOH
end

template node[:httpdConfigFile] do
  source node[:httpdConfigFileTemplate]
  user 'root'
  mode '0755'
end

template node['site1']['indexFile'] do
  source node['site1']['indexFileTemplate']
  user 'root'
  mode '0755'
end

template node['site2']['indexFile'] do
  source node['site2']['indexFileTemplate']
  user 'root'
  mode '0755'
end

# Restart httpd service
service 'httpd' do
  action [:restart]
end
