# palera1n
iOS 15.0 - 15.4.1 work in progress semi- tethered checkm8 "developer jailbreak"

# TrollStore

TrollStore in a permasigned jailed app that can permanently install any IPA you open in it.

It works because of a CoreTrust bug that affects iOS 14.0 - 15.4.1 (15.5b4).

**NOTE: TrollStore will _NEVER_ work on anything higher than iOS 15.5 beta 4 (No not on iOS 15.5, not on iOS 15.6 and certainly not on iOS 16.x), please stop asking!**

# What does this do?
It does boot the device with amfi patches, which allows the execution of unsigned code on the ios operating system, and it makes use of what is known as the checkm8 exploit. This is a “developer jailbreak“ meaning it does not come with the Pogo bootstrap already included.

The Pogo bootstrap must be installed with TrollStore, and you must install TrollStore using [these instructions](https://github.com/opa334/TrollStore/blob/73ab06dcb4addc3c6b4069c70c3ec667ed5d9677/install_with_sshrd.md). You should use the script from the repository [kristenlc/SSHRD_Script-High-Sierra](https://github.com/netsirkl64/SSHRD_Script-High-Sierra) when you create your ramdisk.

The ramdisk is used to install TrollStore using the checkm8 exploit. You can get the IPA for the Pogo bootstrap [here](https://nightly.link/elihwyma/Pogo/workflows/build/main/Pogo.zip) and you can use that after you are done getting TrollStore on your iPhone device.

There is no tweak injection as of right now.

**NOTE**: `sudo usbmuxd -p -f` should fix most USB issues on Linux.

<!-- **WARNING**: As of now, this is pretty unstable (atleast just on A11). On my A11 device, it has the deep sleep bug while booted with palera1n, and will kernel panic, or just not wake up until force rebooted, about a minute after being in sleep mode. Patching AMFI also seems to log you out of iCloud? -->

**WARNING**: As of now, on an iPhone X device, it does seem that if you leave your device in a low light area such as a dark bedroom for a period of time of more then 5 minutes it will kernel panic and does require force restarting the device.

**WARNING 2**: We are not responsible for any data loss. The end user of this program accepts full responsibility should something cause the phone to stop working. It is understood that nothing should happen, but jailbreaking has risks in itself. If your device is stuck in recovery, please run `futurerestore --exit-recovery`, or use irecovery.

**WARNING 3**: As of now, it was confirmed that if you do not use the onboard blobs for your device when you are using palera1n then it will cause the device to enter a blank screen after verbose boot. You will have a blank screen on your phone after verbose boot if you do not use the right blobs for palera1n. To ensure you do not get a blank screen after you boot your device with palera1n, you must dump your onboard blobs using [kristenlc/SSHRD_Script-High-Sierra](https://github.com/netsirkl64/SSHRD_Script-High-Sierra) and use those blobs with this script. Please do **not** use the blobs on [tsssaver.1conan.com](https://tsssaver.1conan.com/v2/) for your device as it will cause it to not boot with palera1n. If an issue is opened and you are using blobs other then your onboard blobs, it is considered not- supported and your issue will be closed with no further info given.

**UPDATE**: There has been a video tutorial made for checkm8 vulnerable devices to use palera1n if they are running iOS 15.0 to 15.5 beta 4. The tutorial was made for intel mac computers running high sierra. [iOS 15.0 - 15.5b4 JAILBREAK: Sileo ACHIEVED by palera1n Jailbreak - YouTube](https://www.youtube.com/watch?v=fdyHjS1WqKg)

**Known working devices:**
- iPhone X
- iPhone 7
- iPhone 6s

<del>

# How to use
1. Clone this repo with `git clone -b legacy --recursive https://github.com/netsirkl64/palera1n-High-Sierra && cd palera1n-High-Sierra`
2. Prepare your blob for the **current version** you are on
    1. Put your device into DFU mode using readily available instructions online
    2. `cd SSHRD_Script`
    3. `./dump_onboard_blobs.sh <your iOS version here>`
    4. Use the on- screen instructions, it is very simple and easy to follow
    5. `mv dumped.shsh ../`
3. Run `sudo ./palera1n.sh dumped.shsh`
    - \[A10+\] Before running, you **must** disable your passcode
    - If you want to start from DFU, run `sudo ./palera1n.sh dumped.shsh --dfu <your iOS version here>`
4. Make sure your device is in normal mode, if you didn't start from DFU
5. Follow the steps
    - Right now, getting into DFU is steps for A11, please suppliment the steps for your device
6. Install Pogo through TrollStore, then hit Install in the Pogo app!
    - You can get a Pogo IPA from [here](https://nightly.link/elihwyma/Pogo/workflows/build/main/Pogo.zip)
    - You should now see Sileo on your homescreen, enjoy!
    - You'll have to uicache in the Pogo app every reboot
</del>
    
# How to use
1. Clone this repo with `git clone --recursive https://github.com/kristenlc/palera1n-High-Sierra && cd palera1n-High-Sierra`
2. Run `sudo ./palera1n.sh --dfu <your iOS version here>` you want to start from DFU
    - \[A10+\] Before running, you **must** disable your passcode
3. Follow the steps
4. Install Pogo through TrollStore, then hit Install in the Pogo app!
    - You can get a Pogo IPA from [here](https://nightly.link/elihwyma/Pogo/workflows/build/main/Pogo.zip)
    - You should now see Sileo on your homescreen, enjoy!
    - You'll have to uicache in the Pogo app every reboot

# Credits
- [Nathan](https://github.com/verygenericname) for a lot of the code from SSHRD_Script
- [Mineek](https://github.com/mineek) for some of the patching and booting commands
- [Amy](https://github.com/elihwyma) for the Pogo app
- [nyuszika7h](https://github.com/nyuszika7h) for the script to get into DFU
- [the Procursus Team](https://github.com/ProcursusTeam) for the amazing bootstrap
