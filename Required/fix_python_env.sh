#!/usr/bin/env bash

cd /Library/Frameworks/Python.framework/Versions/
for d in */ ; do
cd "$d"
cd bin
python="$(pwd)/python3"
cd ..
cd ..
done

echo "$python"

sudo ln -s "$python" /bin/python3
sudo killall -9 Terminal
