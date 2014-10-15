# coding: utf-8

require "net/ssh"

module HostInfoSsh
  
  module Ssh
    
    stdout_list = []
    stderr = ""
    
    def self.connect_ssh(host, user, command_list)
      Net::SSH.start(host, user) do |ssh|
        command_list.each do |command|
          ssh.exec!(command) do |channel, stream, data|
            std_tmp = ""
            std_tmp << data if stream == :stdout
            stdout_list.push(std_tmp)
            stderr << data if stream == :stderr
          end
        end
      end
    end
  end
end