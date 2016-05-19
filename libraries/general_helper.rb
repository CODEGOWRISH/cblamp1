                                                           
#                                                                                         
# Helper for general purpose work                                 
#

module General
 module FileHelper

  def file_exists? (fileName)
    ::File.exists? (fileName)
  end

  def touch_a_file (fileName)

    if file_exists? (fileName)
    then
      Chef::Log.warn("File exists " + fileName)
    else
      Chef::Log.info("Touching file " + fileName)

      bash 'touch a file' do
        user "root"
        code <<-EOH
          touch #{fileName}
        EOH
      end
    end
  end

 end
end
