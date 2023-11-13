#!/usr/bin/env ruby

require 'dotenv-vault/load'
require 'net/ssh'
require_relative './colorize.rb'

def get_category_from_script_name(script_name)
  # 59 = proxy avoidance
  # 61 = phish
  # 140 = sps_whitelist
  # 146 = sps_warnlist

  case script_name
  when 'phish'
    return 161
  when 'whitelist'
    return 140
  when 'warnlist'
    return 146
  else
    return 141 # sps-block-list
  end
end

# Pull from .env file.
hostname = ENV["FIREWALL_HOST"]
username = ENV["USERNAME"]
password = ENV["PASSWORD"]

# See what this script was called as, so we can determine the category.
script_name = File.basename(__FILE__)

puts
puts "[*] Running as #{script_name}".green

url = "www.grgrgrgrgrgrg.com"
comment = "This is a test entry and should be deleted ASAP. Added by #{username} at "
category = get_category_from_script_name(script_name)

command = <<-EOF
config webfilter ftgd-local-rating
edit "#{url}"
  set status enable
  set comment "#{comment}"
  set rating #{category}
next
EOF

puts "[*] Applying the following configuration:".green
puts

command.each_line do |line|
  puts "\t" + line.chomp.magenta
end

# Net::SSH.start(hostname, username, password: password) do |ssh|
#   output = ssh.exec!(command)
#   puts output
# end
