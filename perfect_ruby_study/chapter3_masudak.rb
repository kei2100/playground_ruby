#!/usr/bin/env ruby

require 'bundler'
Bundler.require

require 'open3'
require 'systemu'

def exec_command_open3(cmd)
  o, e, s = Open3.capture3(cmd)
  p [s, o, e]
end

def exec_command_systemu(cmd)
  s, o, e = systemu(cmd)
  p [s, o, e]
end

commands = ['hostname', 'ls -l /hoge', 'w | grep [a]rima_kei', 'w | grep [m]asuda_kenichi']

commands.each do |cmd|
  exec_command_open3(cmd)
  exec_command_systemu(cmd)
end


