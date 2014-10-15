# coding: utf-8
module HostInfoSsh

  class Command
    
    def self.run(argv)
      command_list = FileOpen.read_file('lib/host_info_ssh/command_list.txt')
      host_info, err_info = Ssh.connect_ssh(argv[0], argv[1], command_list)
      #p host_info
      #p err_info
      output = Outputformat.markdown(argv[0], host_info)
      puts output
    end
    
    def initialize(argv)
      @argv = argv
    end
  end
end
