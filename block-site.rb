#!/usr/bin/env ruby

require 'dotenv-vault/load'
require 'net/ssh'

hostname = ENV["FIREWALL_HOST"]
username = ENV["USERNAME"]
password = ENV["PASSWORD"]
  
Net::SSH.start(hostname, username, password: password) do |ssh|
  output = ssh.exec!("get system info")
  puts output
end





# from datetime import date

# from netmiko import ConnectHandler
# import sys
# from dotenv import dotenv_values

# config = dotenv_values(".env")
# # print(config)

# # 59 = proxy avoidance
# # 61 = phish
# # 140 = sps_whitelist
# # 146 = sps_warnlist


# def print_usage():
#     print(
#         """
# Usage: block-site.py <url to block>
# """
#     )


# if len(sys.argv) == 2:
#     script_name = sys.argv[0]
#     url = sys.argv[1]
#     today = date.today()
#     category = 141  # 161 is sps_blacklist

#     if "phish" in script_name:
#         category = 61

#     if "whitelist" in script_name:
#         category = 140

#     if "warnlist" in script_name:
#         category = 146

#     print(f"[*] Running block-site.py via {script_name}.")
#     print(f"[*] Logging into {config['FIREWALL_HOST']} as user {config['USERNAME']}.")

#     comment = f"Created on {today} by {config['USERNAME']} with block-site.py."
#     cfg_list = [
#         "config webfilter ftgd-local-rating",
#         f'  edit "{url}"',
#         "  set status enable",
#         f"  set comment '{comment}'",
#         f"  set rating {category}",
#         "next",
#     ]

#     with ConnectHandler(
#         ip=config["FIREWALL_HOST"],
#         port=config["FIREWALL_SSH_PORT"],
#         username=config["USERNAME"],
#         password=config["PASSWORD"],
#         device_type="fortinet",
#     ) as ch:
#         print(f"[*] Sending commands to {config['FIREWALL_HOST']}.")
#         print()
#         cfg_output = ch.send_config_set(cfg_list)
#         print(cfg_output.replace("\n\n", "\n"))
# else:
#     print_usage()
