# coding: utf-8
module HostInfoSsh

  class Command
        
    def initialize(argv)
      @argv = argv
    end
    
    def self.run(argv)
      new(argv).execute
    end
    
    def execute
      
      options = Options.parse!(@argv)
      #p @command_list
      if options[:commandfile]
        command_list_file = options[:commandfile]
      else
        command_list_file = 'lib/host_info_ssh/command_list.txt'
      end
      
      if options[:outputfile]
        output_file = options[:outputfile]
      else
        output_file = "#{options[:nodename]}.md"
      end
      
      command_list = FileOpen.read_file(command_list_file)
      host_info, err_info = Ssh.connect_ssh(options[:nodename], options[:username], command_list)
      #p host_info
      #p err_info
      output = Outputformat.markdown(options[:nodename], host_info, err_info)
      #p output
      #p output_file
      Fileout.output_file(output_file, output)
    end
  end
end
