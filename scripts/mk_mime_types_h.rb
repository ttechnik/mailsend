#!/usr/bin/env ruby

##################################################
# make mime_types.h file from mime.types file
# muquit@muquit.com Dec-14-2013 
##################################################
#
require 'fileutils'

class MakeMimeTypesH
  ME = __FILE__
  MIME_TYPES_FILE = Dir.pwd + "/mime.types"

  def initialize
  end

  def log(msg)
    t = Time.new
    puts "#{t}: #{msg}"
  end

 def make_mime_types_h
  lines = File.read(MIME_TYPES_FILE) if File.exists?(MIME_TYPES_FILE)
  t = Time.new
  puts <<-EOF
/*
** WARNING: This file is auto generated. DO NOT MODIFY
**  Generated by #{ME} from #{MIME_TYPES_FILE}
**  #{t}
*/
EOF
  linesa = lines.split("\n")
  linesa.each do |line|
    line.chomp if line
    next if line =~ /^#/ || line.length == 0
    if line =~ /(.+)\t+(.+)$/
      type = $1
      exts = $2
      type = type.gsub(/\t+/,'')
      extsa = exts.split("\s")
      extsa.each do |e|
        puts "{ \"#{e}\",\"#{type}\"},"
      end
    end
  end
 end

  def doit
    make_mime_types_h
  end

end

if __FILE__ == $0
  MakeMimeTypesH.new.doit
end
