#!/usr/bin/env ruby

require 'json'

if ARGV.size != 2
  puts "search_mac.rb dictfile mac"
  exit 1
end

dict = JSON.parse(File.read(ARGV[0]))
oui = ARGV[1].split(":")[0..2].join(":").upcase

puts dict[oui]
