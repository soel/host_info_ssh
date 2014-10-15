# coding: utf-8

module HostInfoSsh
  
  module Fileout
    
    def self.output_file(file_path, output_data)
      File.open file_path, 'w' do |f|
        f.write oputput_data
      end
    end
  end
end