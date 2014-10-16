# coding: utf-8

require "optparse"

module HostInfoSsh
  class Command
    module Options
      
      def self.parse!(argv)
       options = {}
       #command_parser = OptionParser.new do |opt|
       OptionParser.new do |opt|
         opt.on_head('-v', '--version', 'show program version') do |v|
           opt.version = HostInfoSsh::VERSION
           puts opt.ver
           exit
         end
         #opt.on('-h', '--help', 'help message'){puts options; exit}
         opt.on('-n NODENAME', '--nodename', 'hostname or ipaddress') {|v| options[:hostname] = v}
         opt.on('-u USERNAME', '--username', 'username') {|v| options[:username] = v}
         
         opt.parse!
       end
       
       return options
      end
    end
  end
end