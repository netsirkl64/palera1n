# palera1n
iOS 15.0-15.4.1 work in progress semi-tethered checkm8 “developer jailbreak“

# What does this do?
It does boot the device with amfi patches, which allows the execution of unsigned code on the ios operating system, and it makes use of what is known as the checkm8 exploit. This is a “developer jailbreak“ meaning it does not come with the Pogo bootstrap already included.

The Pogo bootstrap must be installed with TrollStore, and you must install TrollStore using [these instructions](https://github.com/opa334/TrollStore/blob/main/install_with_sshrd.md). You should use the script from the repository [kristenlc/SSHRD_Script-High-Sierra](https://github.com/kristenlc/SSHRD_Script-High-Sierra) when you create your ramdisk.

The ramdisk is used to install TrollStore using the checkm8 exploit. You can get the IPA for the Pogo bootstrap [here](https://nightly.link/elihwyma/Pogo/workflows/build/main/Pogo.zip) and you can use that after you are done getting TrollStore on your iPhone device.

**There is no tweak injection as of right now.**

# Requirements
[libgeneral 32](https://github.com/tihmstar/libgeneral/tree/254b42f067893ce32a10e8a99b2dfbec2149cb54) must be present on your system for this to work
```
git clone --recursive https://github.com/tihmstar/libgeneral.git
cd libgeneral
git checkout 254b42f067893ce32a10e8a99b2dfbec2149cb54
./autogen.sh
sudo rm -f /usr/local/lib/libgeneral*
make clean
sudo make install
ls /usr/local/lib/libgeneral*
cd ..
```
[pyimg4](https://github.com/m1stadev/PyIMG4) must be present on your system for this to work
```
pip3 install pyimg4
```

**NOTE**: `sudo usbmuxd -p -f` should fix most USB issues on Linux.

<!-- **WARNING**: As of now, this is pretty unstable (atleast just on A11). On my A11 device, it has the deep sleep bug while booted with palera1n, and will kernel panic, or just not wake up until force rebooted, about a minute after being in sleep mode. Patching AMFI also seems to log you out of iCloud? -->

**WARNING**: As of now, on an iPhone X device, it does seem that if you leave your device in a low light area such as a dark bedroom for a period of time of more then 5 minutes it will kernel panic and does require force restarting the device. There has been some changes made to the script that should mitigate these issues, and once it is confirmed that these issues are resolved this warning will be removed.

**WARNING 2**: We are not responsible for any data loss. The end user of this program accepts full responsibility should something cause the phone to stop working. It is understood that nothing should happen, but jailbreaking has risks in itself. If your device is stuck in recovery, please run `futurerestore --exit-recovery`, or use irecovery.

**Known working devices:**
- iPhone X (GSM)

**Known not working devies:**
- iPhone 6s [https://github.com/itsnebulalol/palera1n/issues/5](https://github.com/itsnebulalol/palera1n/issues/5)

# How to use
1. Install libimobiledevice
    - It's needed for `ideviceenterrecovery` and `ideviceinfo`
2. Clone this repo with `git clone https://github.com/kristenlc/palera1n-High-Sierra && cd palera1n-High-Sierra`
3. Prepare your blob for the **current version** you are on
4. Run `./palera1n.sh blob.shsh2`
    - \[A10+\] Before running, you **must** disable your passcode
    - If you want to start from DFU, run `./palera1n.sh blob.shsh2 --dfu <your iOS version here>`
5. Make sure your device is in normal mode, if you didn't start from DFU
6. Follow the steps
    - Right now, getting into DFU is steps for A11, please suppliment the steps for your device
7. Install Pogo through TrollStore, then hit Install in the Pogo app!
    - You can get a Pogo IPA from [here](https://nightly.link/elihwyma/Pogo/workflows/build/main/Pogo.zip)
    - You should now see Sileo on your homescreen, enjoy!
    - You'll have to uicache in the Pogo app every reboot

# Credits
- [Nathan](https://github.com/verygenericname) for a lot of the code from SSHRD_Script
- [Mineek](https://github.com/mineek) for some of the patching and booting commands
- [Amy](https://github.com/elihwyma) for the Pogo app
- [nyuszika7h](https://github.com/nyuszika7h) for the script to get into DFU
- [the Procursus Team](https://github.com/ProcursusTeam) for the amazing bootstrap
