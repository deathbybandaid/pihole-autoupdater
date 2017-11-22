#!/bin/bash
echo " "

echo "Updating Pi-hole"
bash /etc/.pihole/advanced/Scripts/update.sh
echo " "

declare -a servicecheckarray=("pihole-FTL" "dnsmasq" "lighttpd")

for i in "${servicecheckarray[@]}"
do
echo 'Checking ' $i
if (( $(ps -ef | grep -v grep | grep $i | wc -l) > 0 ))
then
echo $i ' is running!!!'
else
echo $i ' is not running!!!'
echo $i ' is restarting!!!'
service $i restart
fi
echo ""
done
