binpack=/jbin/binpack

# uicache loader app
$binpack/bin/mkdir -p /var/.palera1n
$binpack/bin/rm -rf /var/.palera1n/loader.app
$binpack/bin/cp -R /jbin/loader.app /var/.palera1n
$binpack/usr/bin/plooshiuicache -p /var/.palera1n/loader.app

if [ -e /etc/rc.d/substitute-launcher ]; then
    /sbin/mount -uw /private/preboot
    /sbin/mount -uw /
    /bin/launchctl bootstrap system /Library/LaunchDaemons
    /usr/libexec/firmware
    /usr/sbin/pwd_mkdb -p /etc/master.passwd
    /Library/dpkg/info/debianutils.postinst configure 99999
    /Library/dpkg/info/apt.postinst configure 99999
    /Library/dpkg/info/dash.postinst configure 99999
    /Library/dpkg/info/zsh.postinst configure 99999
    /Library/dpkg/info/bash.postinst configure 99999
    /Library/dpkg/info/vi.postinst configure 99999
    /Library/dpkg/info/openssh-server.extrainst_ install
    /usr/sbin/pwd_mkdb -p /etc/master.passwd
    /usr/bin/chsh -s /usr/bin/zsh mobile
    /usr/bin/chsh -s /usr/bin/zsh root
    /usr/bin/sh /launch_ssh_daemon.sh
    /usr/bin/ldid -s /usr/bin/apt
    /usr/bin/ldid -s /etc/rc.d/substitute-launcher
    /etc/rc.d/substitute-launcher
    /usr/libexec/firmware

    # respring
    $binpack/usr/bin/killall -9 SpringBoard

    echo "[post.sh] done"
    exit 0
else
    # respring
    $binpack/usr/bin/killall -9 SpringBoard

    echo "[post.sh] done"
    exit
fi
