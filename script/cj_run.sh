#!/bin/bash
function check_online
{
	if ping -c 1 github.com &> /dev/null; then
		echo 1;
	else
		echo 0;
	fi
}

# Initial check to see if we are online
IS_ONLINE=$(check_online)
# How many times we should check if we're online - this prevents infinite looping
MAX_CHECKS=10
# Initial starting value for checks
CHECKS=0

# Loop while we're not online.
while [[ $IS_ONLINE -eq 0 ]]; do
    # We're offline. Sleep for a bit, then check again

    sleep 10;
    IS_ONLINE=check_online

    CHECKS=$[ $CHECKS + 1 ]
    if [ $CHECKS -gt $MAX_CHECKS ]; then
        break
    fi
done

if [[ $IS_ONLINE -eq 0 ]]; then
    # We never were able to get online. Kill script.
	echo "Didn't get online Status" > /home/pi/klipper_config/script/gitpush.log
    exit 1
fi

/home/pi/klipper_config/script/gitpush.sh &> /home/pi/klipper_config/script/gitpush.log

