# coding: utf-8

require "optparse"

module HostInfoSsh
  class Command
    module Options
      
      def self.parse!(argv)
        options = {}

        OptionParser.new do |opt|
          opt.on_head('-v', '--version', 'show program version') do |v|
            opt.version = HostInfoSsh::VERSION
            puts opt.ver
            exit
          end
          opt.on('-n NODENAME', '--nodename', 'hostname or ipaddress') {|v| options[:nodename] = v}
          opt.on('-u USERNAME', '--username', 'username') {|v| options[:username] = v}
          opt.on('-c COMMANDFILENAME', '--commandfile', 'commandfilename') {|v| options[:commandfile] = v}
          opt.on('-o OUTPUTFILENAME', '--outputfile', 'outputfilename') {|v| options[:outputfile] = v}
          begin
            opt.parse!
          rescue => e #定義されていないオプションが指定された時の処理
            puts "ERROR: #{e}.\n #{opt}"
            exit
          end
          unless options[:nodename] && options[:username] #必須のオプションがない場合の処理
            puts "#{opt}"
            exit
          end
        end
        
        return options
      end
    end
  end
end