#                                                                                         
# Author: Gowrish.Mallipattana                                                            
#                                                                                         
# Testing library code                                    
#

Chef::Recipe.send(:include, General::FileHelper)

touch_a_file ('/tmp/touch_a_file')

