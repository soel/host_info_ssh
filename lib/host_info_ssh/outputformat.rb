# coding: utf-8

module HostInfoSsh
  
  module Outputformat
    
    def self.markdown(host, info_list, err_list)
      output = "# #{host}\n"
      info_list.each do |list|
        #if /^command:/ =~ list
        #  output << list.sub(/^command:/, "##")
        #else
        #  output << list.gsub(/.*"\n".*/, "test")
        #end 
        list_tmp = list.sub(/^command:/, "##")
        output << list_tmp.gsub("\n", "  \n")
      end
      
      output << "## errors\n"
      err_list.each do |list|
        output << list.gsub("\n", "  \n")
      end
      
      return output
    end
  end
end