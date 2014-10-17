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
          opt.on('-n NODENAME', '--nodename', 'host_name or ip_address') {|v| options[:nodename] = v}
          opt.on('-u USERNAME', '--username', 'user_name') {|v| options[:username] = v}
          opt.on('-c COMMANDLIST', '--commandfile', 'commandlist_filename') {|v| options[:commandfile] = v}
          opt.on('-o OUTPUTFILE', '--outputfile', 'output_filename') {|v| options[:outputfile] = v}
          opt.on('-i SSHIDENTITYFILE', '--identityfile', 'ssh_identity_file') {|v| options[:identity] = v}
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