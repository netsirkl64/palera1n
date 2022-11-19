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
### NetworkManager 1.0.2 tweak
It works great on iOS 15 with the palera1n jailbreak as long as you do not install it from Sileo.

Sorry, but Apple Carplay does not play nicely with it and causes a kernel panic.

The tweak works fine as long as you do not ever use Apple Carplay on your device. This tweak is used to improve cell service by letting the user pick if they want Edge or 4G LTE service. This stops the phone from trying to roam between the two when you are out and about. There are many videos online showing you how to use the tweak after it is installed on your phone.

You must install this tweak from the .deb files using ssh with these commands.
```Bash
cd /var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads &&
apt update &&
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
apt update &&
apt install -y ldid curl jq &&
ldid -s /usr/lib/librtmp.1.dylib &&
curl https://debs.kristen.lc/ws.hbang.newterm3_3.0b1_iphoneos-arm.deb -o ws.hbang.newterm3_3.0b1_iphoneos-arm.deb &&
dpkg -i ws.hbang.newterm3_3.0b1_iphoneos-arm.deb
```

### Zebra package manager
You must install this tweak from the .deb file using ssh with these commands.
```Bash
cd /var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads &&
apt update &&
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
apt update &&
apt install -y ldid curl jq &&
ldid -s /usr/lib/librtmp.1.dylib &&
curl https://debs.kristen.lc/org.coolstar.sileo_2.3_iphoneos-arm.deb -o org.coolstar.sileo_2.3_iphoneos-arm.deb &&
dpkg -i org.coolstar.sileo_2.3_iphoneos-arm.deb
```
nano /etc/apt/sources.list.d/sileo.sources
```
Types: deb
URIs: https://havoc.app/
Suites: ./
Components:

Types: deb
URIs: https://repo.chariz.com/
Suites: ./
Components:

Types: deb
URIs: http://mineek.online/
Suites: ./
Trusted: yes
Components:
```

### Cydia package manager
If you run this script to get Cydia on semi tethered palera1n you will brick your device.

You must install this tweak from the .deb file using ssh with these commands.
```Bash
cd /var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads &&
apt update &&
apt install -y ldid curl jq &&
ldid -s /usr/lib/librtmp.1.dylib &&
curl https://debs.kristen.lc/nano_6.4_iphoneos-arm.deb -o nano_6.4_iphoneos-arm.deb &&
dpkg -i nano_6.4_iphoneos-arm.deb &&
curl https://debs.kristen.lc/libmagic1_5.43_iphoneos-arm.deb -o libmagic1_5.43_iphoneos-arm.deb &&
dpkg -i libmagic1_5.43_iphoneos-arm.deb
curl https://debs.kristen.lc/org.thebigboss.repo.icons_1.0.deb -o org.thebigboss.repo.icons_1.0.deb &&
dpkg -i org.thebigboss.repo.icons_1.0.deb &&
curl https://debs.kristen.lc/bzip2_1.0.8_iphoneos-arm.deb -o bzip2_1.0.8_iphoneos-arm.deb &&
dpkg -i bzip2_1.0.8_iphoneos-arm.deb &&
curl https://debs.kristen.lc/gnupg_2.2.11-2_iphoneos-arm.deb -o gnupg_2.2.11-2_iphoneos-arm.deb &&
dpkg --force-all -i gnupg_2.2.11-2_iphoneos-arm.deb &&
apt --fix-broken -y install
curl https://debs.kristen.lc/gzip_1.11_iphoneos-arm.deb -o gzip_1.11_iphoneos-arm.deb &&
dpkg -i gzip_1.11_iphoneos-arm.deb &&
curl https://debs.kristen.lc/lzma_4.32.7-5_iphoneos-arm.deb -o lzma_4.32.7-5_iphoneos-arm.deb &&
dpkg --force-all -i lzma_4.32.7-5_iphoneos-arm.deb &&
curl https://debs.kristen.lc/apt7-lib_0.7.25.3-16_iphoneos-arm.deb -o apt7-lib_0.7.25.3-16_iphoneos-arm.deb &&
dpkg -i apt7-lib_0.7.25.3-16_iphoneos-arm.deb &&
curl https://debs.kristen.lc/apt7-key_0.7.25.3-3_iphoneos-arm.deb -o apt7-key_0.7.25.3-3_iphoneos-arm.deb &&
dpkg -i apt7-key_0.7.25.3-3_iphoneos-arm.deb &&
curl https://debs.kristen.lc/cydia-lproj_1.1.32_b1_iphoneos-arm.deb -o cydia-lproj_1.1.32_b1_iphoneos-arm.deb &&
dpkg --force-all -i cydia-lproj_1.1.32_b1_iphoneos-arm.deb &&
curl https://debs.kristen.lc/xz-utils_5.2.5-3_iphoneos-arm.deb -o xz-utils_5.2.5-3_iphoneos-arm.deb &&
dpkg --force-all -i xz-utils_5.2.5-3_iphoneos-arm.deb &&
curl https://debs.kristen.lc/cydia_1.1.36_iphoneos-arm.deb -o cydia_1.1.36_iphoneos-arm.deb &&
dpkg --force-all -i cydia_1.1.36_iphoneos-arm.deb &&
apt --fix-broken -y install &&
curl https://debs.kristen.lc/org.thebigboss.dismissprogress_1.1.1_iphoneos-arm.deb -o org.thebigboss.dismissprogress_1.1.1_iphoneos-arm.deb &&
dpkg --force-all -i org.thebigboss.dismissprogress_1.1.1_iphoneos-arm.deb &&
ldid -s /Library/dpkg/info/cydia.postinst &&
/Library/dpkg/info/cydia.postinit &&
ldid -s /Applications/Cydia.app
ldid -s /usr/bin/xz &&
ldid -s /usr/libexec/cydia/cydo
```
nano /etc/apt/sources.list.d/sileo.sources
```
Types: deb
URIs: https://havoc.app/
Suites: ./
Components:

Types: deb
URIs: http://mineek.online/
Suites: ./
Trusted: yes
Components:
```
nano /etc/apt/sources.list.d/cydia.list
```
deb https://apt.bingner.com/ ./
deb http://cydia.zodttd.com/repo/cydia/ stable main
deb http://apt.modmyi.com/ stable main
deb https://repo.chariz.com/ ./
deb https://repo.dynastic.co/ ./
```
reboot with palera1n tethered and dpkg will be fixed

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
