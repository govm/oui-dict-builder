#!/usr/bin/env ruby

require 'open-uri'
require 'json'

URL_OUI = "http://standards.ieee.org/develop/regauth/oui/oui.txt"

dict = {}

STDERR.puts "wait a few minutes..."

if ARGV[0]
  path = ARGV[0]
else
  path = URL_OUI
end

open(path) do |f|
  f.each do |line|
    if /\s*([[:print:]]*?)\s*\(hex\)\t*([[:print:]]*?)\r\n/ =~ line
      dict["#{$1.split("-").join(":").upcase}"] = $2.strip
    end
  end
end

puts JSON.pretty_generate(dict)
