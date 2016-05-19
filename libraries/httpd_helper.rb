#                                                                                         
# Helper for httpd install/config                                     
#
# Help to write this:                                                                               
# https://www.chef.io/blog/2014/03/12/writing-libraries-in-chef-cookbooks/
# https://github.com/chef-cookbooks/httpd/tree/master/libraries
# https://github.com/juliandunn/library-demo-cookbook/blob/master/spec/spec_helper.rb
# http://www.rubydoc.info/gems/chef/0.10.4/Chef/ShellOut
#

module Httpd
  module Helper

    include Chef::Mixin::ShellOut

    # Check if HTTPD is already installed
    def httpd_installed?
      cmd = shell_out!('rpm -qa |grep httpd | grep -v httpd-tools | grep -v grep', {:returns => [0,1]})
      cmd.stderr.empty? && (cmd.stdout.include? "httpd")
    end

  end
end
