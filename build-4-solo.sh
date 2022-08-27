#!/bin/bash

# retrieved parts of this from:
# cd /solo-build/build 
# MACHINE=imx6solo-3dr-1080p bitbake sololink -v -c clean 
# MACHINE=imx6solo-3dr-1080p bitbake sololink -v -c compile -D | grep -v 'selecting' | grep -v PREFERRED_PROVIDER | grep -v 'providers' | grep -v Assuming | grep -v Marking | grep -v Considering 

export PATH=/solo-build/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/cortexa9hf-vfp-neon-oe-linux-gnueabi/:$PATH

cd /solo-build/build/tmp-eglibc/work/cortexa9hf-vfp-neon-oe-linux-gnueabi/sololink/AUTOINC+5b745243a2-r0/git/sololink/flightcode/telem_ctrl

rm *.o 
rm ./telem_ctrl

arm-oe-linux-gnueabi-g++  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/solo-build/build/tmp-eglibc/sysroots/imx6solo-3dr-1080p  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -Wall -I../util -I../ini -I../ini/cpp   -c -o telem_ctrl.o telem_ctrl.cpp

arm-oe-linux-gnueabi-g++  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/solo-build/build/tmp-eglibc/sysroots/imx6solo-3dr-1080p  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -Wall -I../util -I../ini -I../ini/cpp   -c -o INIReader.o ../ini/cpp/INIReader.cpp

arm-oe-linux-gnueabi-g++  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/solo-build/build/tmp-eglibc/sysroots/imx6solo-3dr-1080p  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -Wall -I../util -I../ini -I../ini/cpp   -c -o telem_dest.o telem_dest.cpp

arm-oe-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/solo-build/build/tmp-eglibc/sysroots/imx6solo-3dr-1080p  -O2 -pipe -g -feliminate-unused-debug-types -Wall -I../util -I../ini -I../ini/cpp   -c -o arp_table.o ../util/arp_table.c

arm-oe-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/solo-build/build/tmp-eglibc/sysroots/imx6solo-3dr-1080p  -O2 -pipe -g -feliminate-unused-debug-types -Wall -I../util -I../ini -I../ini/cpp   -c -o hostapd_ctrl.o ../util/hostapd_ctrl.c

arm-oe-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/solo-build/build/tmp-eglibc/sysroots/imx6solo-3dr-1080p  -O2 -pipe -g -feliminate-unused-debug-types -Wall -I../util -I../ini -I../ini/cpp   -c -o util.o ../util/util.c

arm-oe-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/solo-build/build/tmp-eglibc/sysroots/imx6solo-3dr-1080p  -O2 -pipe -g -feliminate-unused-debug-types -Wall -I../util -I../ini -I../ini/cpp   -c -o ini.o ../ini/ini.c

arm-oe-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/solo-build/build/tmp-eglibc/sysroots/imx6solo-3dr-1080p  -O2 -pipe -g -feliminate-unused-debug-types -Wall -I../util -I../ini -I../ini/cpp   -c -o mutex.o ../util/mutex.c

arm-oe-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/solo-build/build/tmp-eglibc/sysroots/imx6solo-3dr-1080p  -O2 -pipe -g -feliminate-unused-debug-types -Wall -I../util -I../ini -I../ini/cpp   -c -o syslog.o ../util/syslog.c

arm-oe-linux-gnueabi-g++  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/solo-build/build/tmp-eglibc/sysroots/imx6solo-3dr-1080p  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -Wall -I../util -I../ini -I../ini/cpp  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -o telem_ctrl telem_ctrl.o INIReader.o telem_dest.o arp_table.o hostapd_ctrl.o util.o ini.o mutex.o syslog.o -lpthread -lrt

rm *.o 

ls -lrt 

strings ./telem_ctrl | grep conf

cd /vagrant