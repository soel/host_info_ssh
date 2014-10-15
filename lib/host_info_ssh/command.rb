# coding: utf-8
module HostInfoSsh

  class Command
    
    def self.run(argv)
      #new(argv).execute
      puts argv
    end
    
    def initialize(argv)
      @argv = argv
    end
  end
end
