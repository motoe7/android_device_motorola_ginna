#!/vendor/bin/sh

touch_path_chipone=/sys/chipone-tddi
touch_path_fts=/sys/devices/platform/soc/7af7000.spi/spi_master/spi7/spi7.0
firmware_file_chipone=/vendor/firmware/chipone-tianma-ICNL9911S-0125-0000-ginna.bin
firmware_file_fts=focaltech-hlt-ft8006s_aa-0b-0000-ginna.bin

wait_for_poweron()
{
	local wait_nomore
	local readiness
	local count
	wait_nomore=60
	count=0
	if [[ -d $touch_path_chipone ]];
	then
	    readiness=$(cat $touch_path_chipone/poweron)
	else
	    readiness=$(cat $touch_path_fts/poweron)
	fi
	while true; do
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

if [[ -d $touch_path_chipone ]];
then
     echo 1 > $touch_path_chipone/forcereflash
     echo $firmware_file_chipone > $touch_path/doreflash
else
     echo 1 > $touch_path_fts/forcereflash
     echo $firmware_file_fts > $touch_path_fts/doreflash
fi
return 0
