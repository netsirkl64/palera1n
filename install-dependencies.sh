#!/usr/bin/env sh

set -e

which -s python
if [[ $? != 0 ]] ; then
    echo "Python must be present on your system in order to run this script"
    exit
fi

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install make cmake automake autoconf libtool pkg-config

git clone --recursive https://github.com/libimobiledevice/libplist.git
cd libplist
git checkout c3af449543795ad4d3ab178120ff69e90fdd2cc8
./autogen.sh
sudo rm -f /usr/local/lib/libplist*
make clean
sudo make install
ls /usr/local/lib/libplist*
cd ..

git clone --recursive https://github.com/tihmstar/libgeneral.git
cd libgeneral
git checkout 254b42f067893ce32a10e8a99b2dfbec2149cb54
./autogen.sh
sudo rm -f /usr/local/lib/libgeneral*
make clean
sudo make install
ls /usr/local/lib/libgeneral*
cd ..

git clone --recursive https://github.com/tihmstar/img4tool.git
cd img4tool
git checkout e26f6e27c5fce7aff9e1ed5fe2b486b9989a5bec
./autogen.sh
sudo rm -f /usr/local/bin/img4tool
make clean
sudo make install
otool -L /usr/local/bin/img4tool
cd ..

python3 -m pip install pyimg4
