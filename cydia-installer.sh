#!/usr/bin/env bash
# this script is made to be run on ios 15 palera1n tethered, absolutely not on mac or linux

cd /var/mobile/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads

ldid -s /usr/bin/apt
apt update

apt install -y ldid curl jq
ldid -s /usr/lib/librtmp.1.dylib

curl https://debs.kristen.lc/libmagic1_5.43_iphoneos-arm.deb -o libmagic1_5.43_iphoneos-arm.deb
dpkg --force-all -i libmagic1_5.43_iphoneos-arm.deb

curl https://debs.kristen.lc/nano_6.4_iphoneos-arm.deb -o nano_6.4_iphoneos-arm.deb
dpkg --force-all -i nano_6.4_iphoneos-arm.deb

curl https://debs.kristen.lc/org.thebigboss.repo.icons_1.0.deb -o org.thebigboss.repo.icons_1.0.deb
dpkg --force-all -i org.thebigboss.repo.icons_1.0.deb

curl https://debs.kristen.lc/bzip2_1.0.8_iphoneos-arm.deb -o bzip2_1.0.8_iphoneos-arm.deb
dpkg --force-all -i bzip2_1.0.8_iphoneos-arm.deb

curl https://debs.kristen.lc/gnupg_2.2.11-2_iphoneos-arm.deb -o gnupg_2.2.11-2_iphoneos-arm.deb
dpkg --force-all -i gnupg_2.2.11-2_iphoneos-arm.deb

curl https://debs.kristen.lc/gzip_1.11_iphoneos-arm.deb -o gzip_1.11_iphoneos-arm.deb
dpkg --force-all -i gzip_1.11_iphoneos-arm.deb

curl https://debs.kristen.lc/lzma_4.32.7-5_iphoneos-arm.deb -o lzma_4.32.7-5_iphoneos-arm.deb
dpkg --force-all -i lzma_4.32.7-5_iphoneos-arm.deb

curl https://debs.kristen.lc/apt7-lib_0.7.25.3-16_iphoneos-arm.deb -o apt7-lib_0.7.25.3-16_iphoneos-arm.deb
dpkg --force-all -i apt7-lib_0.7.25.3-16_iphoneos-arm.deb

curl https://debs.kristen.lc/apt7-key_0.7.25.3-3_iphoneos-arm.deb -o apt7-key_0.7.25.3-3_iphoneos-arm.deb
dpkg --force-all -i apt7-key_0.7.25.3-3_iphoneos-arm.deb

curl https://debs.kristen.lc/cydia-lproj_1.1.32_b1_iphoneos-arm.deb -o cydia-lproj_1.1.32_b1_iphoneos-arm.deb
dpkg --force-all -i cydia-lproj_1.1.32_b1_iphoneos-arm.deb

curl https://debs.kristen.lc/xz-utils_5.2.5-3_iphoneos-arm.deb -o xz-utils_5.2.5-3_iphoneos-arm.deb
dpkg --force-all -i xz-utils_5.2.5-3_iphoneos-arm.deb

curl https://debs.kristen.lc/cydia_1.1.36_iphoneos-arm.deb -o cydia_1.1.36_iphoneos-arm.deb
dpkg --force-all -i cydia_1.1.36_iphoneos-arm.deb

curl https://debs.kristen.lc/org.thebigboss.dismissprogress_1.1.1_iphoneos-arm.deb -o org.thebigboss.dismissprogress_1.1.1_iphoneos-arm.deb
dpkg --force-all -i org.thebigboss.dismissprogress_1.1.1_iphoneos-arm.deb

ldid -s /Library/dpkg/info/cydia.postinst
/Library/dpkg/info/cydia.postinst
rm /Library/dpkg/info/cydia.postinst

ldid -s /usr/bin/apt
apt --fix-broken -y install

ldid -s /Applications/Cydia.app
ldid -s /usr/bin/xz
ldid -s /usr/libexec/cydia/cydo
