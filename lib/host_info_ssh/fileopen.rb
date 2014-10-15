# coding: utf-8

module HostInfoSsh
  
  module FileOpen
    
    def self.read_file(path)
      array = []
      File.open(path) do |f|
         array = f.readlines
      end
      
      return array
    end
  end
end