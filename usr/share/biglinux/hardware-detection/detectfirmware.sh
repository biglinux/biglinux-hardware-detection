#!/bin/bash

##############
# Detect firmware needed
# By Bruno Goncalves < www.biglinux.com.br >
# 2022/03/01
# License GPL V2 or greater
###############

cd /usr/share/biglinux/hardware-detection/

OIFS=$IFS
IFS=$'\n'

    FIRMWARE_LIST="$(grep -R / firmware/)"

    for i  in  $(dmesg | grep firmware | grep error | grep loading | cut -f2 -d] | cut -f2,5 -d" "); do

        FILE="$(echo "$i" | cut -f2 -d" " | sed 's|.*/||g')"

            for x  in  $(echo "$FIRMWARE_LIST" | grep "$FILE"); do

                    MODULE="$(echo "$i" | cut -f1 -d" ")"
                    PKG="$(echo "$i" | cut -f1 -d: | cut -f2 -d/)"

                    echo "Firmware: $FILE"
                    echo "Module: $MODULE"
                    echo "Package: $PKG"

            done

    done

IFS=$OIFS
