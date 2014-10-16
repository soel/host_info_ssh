# coding: utf-8
module HostInfoSsh

  class Command
        
    def self.run(argv)
      options = Options.parse!(@argv)
      
      #p options
      #p options[:n]
      #p options[:u]
      command_list = FileOpen.read_file('lib/host_info_ssh/command_list.txt')
      host_info, err_info = Ssh.connect_ssh(options[:hostname], options[:username], command_list)
      p host_info
      #p err_info
      #output = Outputformat.markdown(argv[0], host_info, err_info)
      #puts output
      #Fileout.output_file("test.md", output)
    end
    
    def initialize(argv)
      @argv = argv
    end
  end
end
