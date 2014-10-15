# coding: utf-8

require "net/ssh"

module HostInfoSsh
  
  module Ssh

    def self.connect_ssh(host, user, command_list)
      stdout_list = []
      stderr = ""
      
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
      
      return stdout_list, stderr
    end
  end
end