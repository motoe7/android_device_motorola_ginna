#!/system/bin/sh

touch_path=/sys/chipone-tddi
firmware_file=/vendor/firmware/chipone-tianma-ICNL9911S-0125-0000-ginna.bin

wait_for_poweron()
{
	local wait_nomore
	local readiness
	local count
	wait_nomore=60
	count=0
	while true; do
		readiness=$(cat $touch_path/poweron)
		if [ "$readiness" == "1" ]; then
			break;
		fi
		count=$((count+1))
		[ $count -eq $wait_nomore ] && break
		sleep 1
	done
	if [ $count -eq $wait_nomore ]; then
		return 1
	fi
	return 0
}

wait_for_poweron

echo 1 > $touch_path/forcereflash
echo $firmware_file > $touch_path/doreflash
