#!/system/bin/sh
setprop gsm.radio.kickstart off

if [ $(getprop ro.boot.baseband) == "mdm" ]; then

    for f in $(ls /data/qcks/); do
        (ls -l /data/qcks/$f | grep root) && rm /data/qcks/$f;
    done

    chown system:system $(realpath /dev/block/platform/msm_sdcc.1/by-name/radio)
    chmod 660 $(realpath /dev/block/platform/msm_sdcc.1/by-name/radio)

    echo 1 > /sys/module/rmnet_usb/parameters/rmnet_data_init

    setprop gsm.radio.kickstart on
fi
