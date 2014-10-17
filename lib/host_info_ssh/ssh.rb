# coding: utf-8

require "net/ssh"
require "timeout"

module HostInfoSsh
  
  module Ssh

    def self.connect_ssh(host, user, command_list, identity_file)
      begin
        stdout_list = []
        stderr_list = ["error:"]
        
        if identity_file
          opt = {
            :keys => identity_file
          }
        else
          opt ={}
        end
        
        Timeout::timeout(10) do
          begin
            #Net::SSH.start(host, user, :keys => [identity_file] if indentity_file) do |ssh|
            Net::SSH.start(host, user, opt) do |ssh|
              command_list.each do |command|
                ssh.exec!(command) do |channel, stream, data|
                  stdout = "command: #{command}"
                  stderr = ""
                  stdout << data if stream == :stdout
                  stderr << data if stream == :stderr
                  if stderr == "" 
                    stdout_list.push(stdout)
                  else
                    stdout_list.push("")
                    stderr_list.push(stderr)
                  end
                end
              end
            end
          
          rescue Net::SSH::HostKeyMismatch => e
            puts e
            exit
          rescue StandardError => e
            puts e
            exit
          end
        end
        
        return stdout_list, stderr_list
      
      rescue Timeout::Error
        puts "Timed out trying to get a connection"
        exit
      end
    end
  end
end