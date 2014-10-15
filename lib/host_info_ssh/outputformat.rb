# coding: utf-8

module HostInfoSsh
  
  module Outputformat
    
    n = 0
    def self.markdown(host, command_list, info_list)
      output << "# #{host}"
      command_list.each do |command|
        output << "## #{command}\n"
        output << info_list[n]
        n = n + 1
      end
    end
  end
end