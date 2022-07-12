#! /usr/bin/bash

CONFIG=/etc/tlp.conf

cat <<END
Battery Charging Threshold
please choose one of these options:

1. Full Mode
   will charges the battery to full capacity this is
   the best option for you who always working in mobile

2. Balanced Mode
   will charges the battery to 80% capacity
   balancing between battery life and battery 
   lifespan, best option if you occasionally work in
   mobile

3. Maximum Lifespan Mode
   will charges the battery to 60% capacity
   good for extending battery lifespan, choose this option
   if you always running your laptop on AC power
END

echo -e '\ntype the number of mode you want to use:'

read MODE

if [ "$MODE" == "1" ]
then
 #insert value to config file and create backup
 sudo sed -ibak -e '521 s/BAT0=.*/BAT0=95/1' -e '522 s/BAT0=.*/BAT0=100/1' $CONFIG
elif [ "$MODE" == "2" ]
then
 sudo sed -ibak -e '521 s/BAT0=.*/BAT0=75/1' -e '522 s/BAT0=.*/BAT0=80/1' $CONFIG
elif [ "$MODE" == "3" ]
then
 sudo sed -ibak -e '521 s/BAT0=.*/BAT=55/1' -e '522 s/BAT0=.*/BAT0=60/1' $CONFIG
else
 echo 'enter a valid number in range 1 to 3'
fi

# start service
sudo tlp start

#check status and threshold
BAT_THRESH=$(cat /sys/class/power_supply/BAT0/charge_control_end_threshold)
BAT_STAT=$(cat /sys/class/power_supply/BAT0/status)

MODE_LIST=(1,2,3)

if [ "$MODE" == "1" ] || [ "$MODE" == "2" ] || [ "$MODE" == "3" ]
then
 cat <<END
Success Altered Mode to "Mode $MODE"
Battery Threshold "$BAT_THRESH%"
END
fi



