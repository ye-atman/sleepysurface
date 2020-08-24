#!/bin/sh
# Reload kernel mods for surface pro wifi adapter (Marvell 88W8897) #
#  and builtin touchpad.  Resolves issues with no lost wifi conn    #
#  connection and forgotten touchpad settings (i.e., tap to click)  #
#  after resuming from suspend mode in Mint 20 (Ulyana)		    # 

# Probably needs to run as root

modprobe -r mwifiex_pcie
modprobe -r mwifiex
modprobe -r cfg80211

sleep 3  # just for good measure
modprobe -i cfg80211
modprobe -i mwifiex
modprobe -i mwifiex_pcie

sleep 1
modprobe -r hid_multitouch
#TODO:  may get fatal error to be handled on hid
modprobe -r hid

sleep 3
modprobe -i hid_multitouch
modprobe -i hid
