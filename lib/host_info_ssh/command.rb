# coding: utf-8
module HostInfoSsh

  class Command
    
    def self.run(argv)
      command_list = FileOpen.read_file('lib/host_info_ssh/command_list.txt')
      #p command_list
      host_info = Ssh.connect_ssh(argv[0],argv[1], command_list)
      puts host_info
    end
    
    def initialize(argv)
      @argv = argv
    end
  end
end
