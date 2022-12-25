#!/usr/bin/env bash

mkdir -p /tmp/palera1n/palera1n-High-Sierra
cd /tmp/palera1n/palera1n-High-Sierra

os=$(uname)
if [ "$os" = "Darwin" ]; then
    apples="$(system_profiler SPUSBDataType 2> /dev/null | grep -B1 'Vendor ID: 0x05ac' | grep 'Product ID:' | cut -dx -f2 | cut -d' ' -f1 | tail -r)"
elif [ "$os" = "Linux" ]; then
    apples="$(lsusb | cut -d' ' -f6 | grep '05ac:' | cut -d: -f2)"
fi
device_count=0
usbserials=""
for apple in $apples; do
    case "$apple" in
        12a8|12aa|12ab)
        device_mode=normal
        device_count=$((device_count+1))
        ;;
        1281)
        device_mode=recovery
        device_count=$((device_count+1))
        ;;
        1227)
        device_mode=dfu
        device_count=$((device_count+1))
        ;;
        1222)
        device_mode=diag
        device_count=$((device_count+1))
        ;;
        1338)
        device_mode=checkra1n_stage2
        device_count=$((device_count+1))
        ;;
        4141)
        device_mode=pongo
        device_count=$((device_count+1))
        ;;
    esac
done
if [ "$device_count" = "0" ]; then
    device_mode=none
elif [ "$device_count" -ge "2" ]; then
    echo "[-] Please attach only one device" > /dev/tty
    kill -30 0
    exit 1;
fi
if [ "$os" = "Linux" ]; then
    usbserials=$(cat /sys/bus/usb/devices/*/serial)
elif [ "$os" = "Darwin" ]; then
    usbserials=$(system_profiler SPUSBDataType 2> /dev/null | grep 'Serial Number' | cut -d: -f2- | sed 's/ //')
fi
if grep -qE '(ramdisk tool|SSHRD_Script) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) [0-9]{1,2} [0-9]{4} [0-9]{2}:[0-9]{2}:[0-9]{2}' <<< "$usbserials"; then
    device_mode=ramdisk
fi
echo "$device_mode"
