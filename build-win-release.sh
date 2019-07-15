#!/bin/sh

if ! which x86_64-w64-mingw32-gcc > /dev/null ; then
	echo "Cannot find 64-bit MingW C compiler."
	exit 1
fi

if ! which x86_64-w64-mingw32-g++ > /dev/null ; then
	echo "Cannot find 64-bit MingW C++ compiler."
	exit 1
fi

if ! which i686-w64-mingw32-gcc > /dev/null ; then
	echo "Cannot find 32-bit MingW C compiler."
	exit 1
fi

if ! which i686-w64-mingw32-g++ > /dev/null ; then
	echo "Cannot find 32-bit MingW C++ compiler."
	exit 1
fi

if ! which zip > /dev/null ; then
	echo "Cannot find zip utility."
	exit 1
fi

if ! which git > /dev/null ; then
	echo "Cannot find git."
	exit 1
fi

CWD=$(pwd)
if [ ! -d $CWD/.git ]; then
	echo "Not in smartmontools-xbox git repository."
	exit 1
fi

# Clear the repository of any untracked files.
git clean -d -f -x

# Prepare directories to build zip files
mkdir release
cd release
#mkdir -p standalone/32-bit
#mkdir -p standalone/64-bit
mkdir xboxhdm23-beta2
mkdir -p xboxhdm23-beta3/XboxHD
cd $CWD

# Build 32-bit executables
cd smartmontools
./autogen.sh || exit 1
./configure --build=$(./config.guess) --host=i686-w64-mingw32 || exit 1
make $1 || exit 1
cd $CWD
#cp smartmontools/smartctl.exe release/standalone/32-bit
#cp smartmontools/drivedb.h release/standalone/32-bit
cp smartmontools/smartctl.exe release/xboxhdm23-beta2/smartctl32.exe
cp smartmontools/drivedb.h release/xboxhdm23-beta2
cp smartmontools/smartctl.exe release/xboxhdm23-beta3/XboxHD/smartctl32.exe
cp smartmontools/drivedb.h release/xboxhdm23-beta3/XboxHD
cp xboxhdm23usb/beta2/*.bat release/xboxhdm23-beta2
git clean -d -f smartmontools

# Build 64-bit executables
cd smartmontools
./autogen.sh || exit 1
./configure --build=$(./config.guess) --host=x86_64-w64-mingw32 || exit 1
make $1 || exit 1
cd $CWD
#cp smartmontools/smartctl.exe release/standalone/64-bit
#cp smartmontools/drivedb.h release/standalone/64-bit
cp smartmontools/smartctl.exe release/xboxhdm23-beta2/smartctl.exe
cp smartmontools/drivedb.h release/xboxhdm23-beta2
cp smartmontools/smartctl.exe release/xboxhdm23-beta3/XboxHD/smartctl.exe
cp smartmontools/drivedb.h release/xboxhdm23-beta3/XboxHD
cp xboxhdm23usb/beta3/*.bat release/xboxhdm23-beta3
cp xboxhdm23usb/beta3/XboxHD/*.bat release/xboxhdm23-beta3/XboxHD
git clean -d -f smartmontools

# Build XBoxHDM23USB beta 2 zip
cd release
mv xboxhdm23-beta2 xboxhdm23usb
zip -r smartctl-xbox-7.0-XBoxHDM-2.3-Beta2.zip xboxhdm23usb || exit 1
rm -r xboxhdm23usb
mv xboxhdm23-beta3 xboxhdm23usb
zip -r smartctl-xbox-7.0-XBoxHDM-2.3-Beta3.zip xboxhdm23usb || exit 1
rm -r xboxhdm23usb
