#!/bin/sh

# Install compabitle versions of Unison for Linux, Mac, and Windows.

# Abort on any error, echo what we are doing.
set -e
set -x

# Install Linux Unison for use by container.
curl -L https://github.com/bcpierce00/unison/archive/2.48.4.tar.gz | tar zxv -C /tmp
cd /tmp/unison-2.48.4
sed -i -e 's/GLIBC_SUPPORT_INOTIFY 0/GLIBC_SUPPORT_INOTIFY 1/' src/fsmonitor/linux/inotify_stubs.c
make
cp src/unison src/unison-fsmonitor /usr/local/bin
cd /root
rm -rf /tmp/unison-2.48.4

# Put a compatible copy of Windows Unison in the container for easy reference.
mkdir /windows
cd /windows
#curl -L -o unison-windows.zip https://www.irif.fr/~vouillon/unison/unison%202.48.3.zip
curl -L -o unison-windows.zip https://www.irif.fr/~vouillon/unison/unison%202.48.3%20-%20OCaml%204.02.1.zip
unzip unison-windows.zip
rm unison-windows.zip
mv 'unison 2.48.3 text.exe' unison.exe
rm 'unison 2.48.3 GTK.exe'
ls

# Put a compatible copy of Mac Unison in the container for easy reference.
mkdir /mac-osx
cd /mac-osx
curl -L -o unison-mac-osx.zip http://unison-binaries.inria.fr/files/Unison-OS-X-2.48.15.zip
unzip unison-mac-osx.zip
rm unison-mac-osx.zip
