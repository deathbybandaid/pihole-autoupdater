#!/bin/bash

echo " "

echo "Updating Pi-hole"
bash /etc/.pihole/advanced/Scripts/update.sh
echo " "

echo "Checking Pi-hole-FTL"
if (( $(ps -ef | grep -v grep | grep pihole-FTL | wc -l) > 0 ))
then
echo "pihole-FTL is running!!!"
else
echo "pihole-FTL is restarting!!!"
service pihole-FTL restart
fi
echo " "

echo "Checking dnsmasq"
if (( $(ps -ef | grep -v grep | grep dnsmasq | wc -l) > 0 ))
then
echo "dnsmasq is running!!!"
else
echo "dnsmasq is restarting!!!"
service dnsmasq restart
fi
echo " "

echo "Checking lighttpd"
if (( $(ps -ef | grep -v grep | grep lighttpd | wc -l) > 0 ))
then
echo "lighttpd is running!!!"
else
echo "lighttpd is restarting!!!"
service lighttpd restart
fi
echo " "
