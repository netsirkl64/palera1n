binpack=/jbin/binpack

# uicache loader app
$binpack/bin/mkdir -p /var/.palera1n
$binpack/bin/rm -rf /var/.palera1n/loader.app
$binpack/bin/cp -R /jbin/loader.app /var/.palera1n
$binpack/usr/bin/uicache -p /var/.palera1n/loader.app
$binpack/usr/bin/uicache -a

if [ -e /etc/rc.d/substitute-launcher ]; then
    /sbin/mount -uw /private/preboot
    /sbin/mount -uw /
    /bin/launchctl bootstrap system /Library/LaunchDaemons
    /usr/libexec/firmware
    /usr/bin/ldid -s /usr/bin/apt
    /usr/bin/ldid -s /etc/rc.d/substitute-launcher
    /etc/rc.d/substitute-launcher
    /usr/libexec/firmware
    /usr/bin/sh /launch_ssh_daemon.sh &
    # respring
    /usr/bin/sbreload

    echo "[post.sh] done"
    exit
else
    # respring
    $binpack/usr/bin/killall -9 SpringBoard

    echo "[post.sh] done"
    exit
fi
