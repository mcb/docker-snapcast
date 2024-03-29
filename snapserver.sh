#!/bin/sh
rm -f /run/dbus/dbus.pid
rm -f /var/run/avahi-daemon/pid

dbus-daemon --system 
avahi-daemon -D

if [ $# -gt 1 ]; then
	snapserver "$@"
else
	echo "No arguments for snapserver given, please provide arguments."
fi