# coding: utf-8

module HostInfoSsh
  
  module Outputformat
    
    def self.markdown(host, info_list, err_list)
      output = "# #{host}\n"
      info_list.each do |list|
        if /^command:/ =~ list
          output << list.sub(/^command:/, "##")
        else
          output << list
        end 
      end
      
      err_list.each do |list|
        output << list
      end
      
      return output
    end
  end
end