<h1 align="center">
    <img src="https://avatars.githubusercontent.com/u/114239186?s=100&v=4" alt="palera1n logo">
    <p>palera1n</p>
</h1>
<h3 align="center">An iOS 15.0-15.7.1 work-in-progress, (semi-)tethered checkm8 jailbreak.</h3>
<p align="center">
    <strong><a href="CHANGELOG.md">Change Log</a></strong>
    •
    <strong><a href="https://dsc.gg/palera1n">Discord</a></strong>
    •
    <strong><a href="https://twitter.com/palera1n">Twitter</a></strong>
</p>

# How does it work?
It boots the device with multiple patches required. On first run, it'll boot a ramdisk which dumps your onboard blob, creates a fakefs (if using semi tethered), installs the loader app, and patches your kernel.

# Issues
### SnowBoard 1.5.1 beta1 tweak 
It works great on iOS 15 with the palera1n jailbreak as long as you do not install it from Sileo.

You must install this tweak from the .deb file using ssh with these commands.
```Bash
cd /var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads &&
apt install -y ldid curl jq &&
ldid -s /usr/lib/librtmp.1.dylib &&
curl https://debs.kristen.lc/com.pwnd2e.snowboard_1.5.1Beta1_iphoneos-arm.deb -o com.pwnd2e.snowboard_1.5.1Beta1_iphoneos-arm.deb &&
dpkg -i com.pwnd2e.snowboard_1.5.1Beta1_iphoneos-arm.deb
```
You will have to respring your device from the tips app after installing this tweak from ssh.

### Viola 1.9.7 theme
It works great on iOS 15 with the palera1n jailbreak as long as you do not install it from Sileo.

We should also mention that you should please go and support the creator of this theme and pay for it proper.

This is just an alternative to installing from sileo package manager if that is not working for you.

You must install this tweak from the .deb file using ssh with these commands.
```Bash
cd /var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads &&
apt install -y ldid curl jq &&
ldid -s /usr/lib/librtmp.1.dylib &&
curl https://debs.kristen.lc/com.pwnd2e.snowboard_1.5.1Beta1_iphoneos-arm.deb -o com.pwnd2e.snowboard_1.5.1Beta1_iphoneos-arm.deb &&
dpkg -i com.pwnd2e.snowboard_1.5.1Beta1_iphoneos-arm.deb &&
curl https://debs.kristen.lc/com.bousrih.viola_1.9.7_iphoneos-arm.deb -o com.bousrih.viola_1.9.7_iphoneos-arm.deb &&
dpkg -i com.bousrih.viola_1.9.7_iphoneos-arm.deb
```

### NetworkManager 1.0.2 tweak
It works great on iOS 15 with the palera1n jailbreak as long as you do not install it from Sileo.

Sorry, but Apple Carplay does not play nicely with it and causes a kernel panic.

The tweak works fine as long as you do not ever use Apple Carplay on your device. This tweak is used to improve cell service by letting the user pick if they want Edge or 4G LTE service. This stops the phone from trying to roam between the two when you are out and about. There are many videos online showing you how to use the tweak after it is installed on your phone.

You must install this tweak from the .deb files using ssh with these commands.
```Bash
cd /var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads &&
apt install -y ldid curl jq &&
ldid -s /usr/lib/librtmp.1.dylib &&
curl https://debs.kristen.lc/ccsupport_1.3.8.deb -o ccsupport_1.3.8.deb &&
dpkg -i ccsupport_1.3.8.deb &&
curl https://debs.kristen.lc/com.noisyflake.networkmanager_1.0.2.deb -o com.noisyflake.networkmanager_1.0.2.deb &&
dpkg -i com.noisyflake.networkmanager_1.0.2.deb
```
The tweak does not work right away, you must respring your phone from the Tips app.

### NewTerm 3 tweak
It works great on iOS 15 with the palera1n jailbreak as long as you do not install it from Sileo.

You must install this tweak from the .deb file using ssh with these commands.
```Bash
cd /var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads &&
apt install -y ldid curl jq &&
ldid -s /usr/lib/librtmp.1.dylib &&
curl https://debs.kristen.lc/ws.hbang.newterm3_3.0b1_iphoneos-arm.deb -o ws.hbang.newterm3_3.0b1_iphoneos-arm.deb &&
dpkg -i ws.hbang.newterm3_3.0b1_iphoneos-arm.deb
```

### Zebra package manager
You must install this tweak from the .deb file using ssh with these commands.
```Bash
cd /var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads &&
apt install -y ldid curl jq &&
ldid -s /usr/lib/librtmp.1.dylib &&
curl https://debs.kristen.lc/xyz.willy.zebra_1.1.28_iphoneos-arm.deb -o xyz.willy.zebra_1.1.28_iphoneos-arm.deb &&
dpkg -i xyz.willy.zebra_1.1.28_iphoneos-arm.deb
```

### Sileo package manager
palera1n comes with Sileo Nightly which can be buggy at times ngl.

You must install the regular one from the .deb file using ssh with these commands.
```Bash
cd /var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads &&
apt install -y ldid curl jq &&
ldid -s /usr/lib/librtmp.1.dylib &&
curl https://debs.kristen.lc/org.coolstar.sileo_2.3_iphoneos-arm.deb -o org.coolstar.sileo_2.3_iphoneos-arm.deb &&
dpkg -i org.coolstar.sileo_2.3_iphoneos-arm.deb
```

### Cydia package manager
If you run this script to get Cydia package manager on semi tethered palera1n you will brick your device.

You must install this tweak from the .deb file using ssh with these commands.
```Bash
cd /var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads &&
apt install -y ldid curl jq &&
ldid -s /usr/lib/librtmp.1.dylib &&
curl https://raw.githubusercontent.com/netsirkl64/palera1n-High-Sierra/main/cydia-installer.sh -o cydia-installer.sh &&
sh cydia-installer.sh
```
You should now reboot with palera1n tethered and then your dpkg will be fixed after you open the tips app and hit install for the jailbreak.

You must now run the commands below using ssh now any time you reboot your device with palera1n tethered and install jailbreak using the tips app.
```
rm -f /etc/apt/sources.list.d/sileo.sources
curl https://raw.githubusercontent.com/netsirkl64/palera1n-High-Sierra/main/sileo.sources -o /etc/apt/sources.list.d/sileo.sources
```

### Need help?
If you need help, **please** join our Discord. We disabled issues due to the flood of spam, and difficulty to respond in general. We are much more comfortable on Discord.

Please, please, please, provide necessary info:

- iOS version and device (eg. iPhone 7+ 15.1, iPhone 6s 15.3.1)
- Computer's OS and version (eg. Ubuntu 22.04, macOS 13.0)
- The command you ran
- **Full log from the logs folder**

**DO NOT** harass tweak devs if tweaks don't work. Refer to [here](https://github.com/itsnebulalol/ios15-tweaks) for compatiblity.

You may join [here](https://dsc.gg/palera1n).

### Linux
- Linux has some weird usbmuxd issues. We have tried our best to fix them, but there still are issues. We highly recommend to compile and install usbmuxd2.
- Stop making issues about Linux not being able to connect, we are aware. This includes being stuck on waiting for ramdisk to finish booting.

### Warning
- We are **NOT** responsible for any data loss. The user of this program accepts responsibility should something happen to their device. While nothing should happen, jailbreaking has risks in itself. **If your device is stuck in recovery, please run one of the following:**
   - futurerestore --exit-recovery
   - irecovery -n

### A10 and A11 devices
- On A10 and A11, **you must disable your passcode while in the jailbroken state**.
  - On A10, this can be fixed in the future by implementing blackbird.
  - On A11, we don't have a SEP exploit yet.

# Prerequisites
#### Warning: You must install the Tips app from the App Store before running palera1n.
- A checkm8 vulnerable iOS device on iOS 15 (A8-A11)
  - The device must be on iOS 15.0-15.7.1
- Linux or macOS computer
  - Python 3 must be installed.

# How to use?
A better tutorial can be found [here](https://ios.cfw.guide/installing-palera1n).

1. Clone this repo with `git clone --recursive https://github.com/netsirkl64/palera1n-High-Sierra && cd palera1n-High-Sierra`
2. Run `./palera1n.sh --tweaks <your current iOS version>` (run with `sudo` if you're on linux)
   - [A10 and A11] Before running, **you must disable your passcode**.
   - Put your device in DFU mode before running.
3. Follow the steps on your screen.

# Repos

### Tweaks mode
All repos work when using tweaks mode because it uses normal Procursus and not rootless.

### Rootless 
Repos need to be updated for rootless, here are some that work currently:

- [Mineek's repo](https://mineek.github.io/repo) contains rootless Procursus packages
- The official [palera1n repo](https://repo.palera.in) contains miscellaneous packages

If you want to make a rootless repo, use the official [palera1n repo](https://github.com/palera1n/repo) for reference. Every deb should use the `iphoneos-arm64` architecture, and *nothing* should be on the rootfs. Everything should be in /var/jb.

# Credits
- [LO5R](https://github.com/madhead341)
    - Helping in the debugging process of getting Cydia Package Manager up and running
- [Nathan](https://github.com/verygenericname)
    - The ramdisk that dumps blobs is a slimmed down version of SSHRD_Script
    - Also helped Mineek getting the kernel up and running and with the patches
    - Helping with adding multiple device support
- [Mineek](https://github.com/mineek)
    - For the patching and booting commands
    - Adding tweak support
- [Amy](https://github.com/elihwyma) for the Pogo app
- [checkra1n](https://github.com/checkra1n) for the base of the kpf
- [nyuszika7h](https://github.com/nyuszika7h) for the script to help get into DFU
- [the Procursus Team](https://github.com/ProcursusTeam) for the amazing bootstrap
- [F121](https://github.com/F121Live) for helping test
- [m1sta](https://github.com/m1stadev) for pyimg4
- [tihmstar](https://github.com/tihmstar) for pzb/original iBoot64Patcher/img4tool
- [xerub](https://github.com/xerub) for img4lib and restored_external in the ramdisk
- [Cryptic](https://github.com/Cryptiiiic) for iBoot64Patcher fork
