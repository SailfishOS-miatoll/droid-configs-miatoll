#!/bin/sh
cd /
touch /dev/.coldboot_done

export LD_LIBRARY_PATH=

# Save systemd notify socket name to let droid-init-done.sh pick it up later
echo $NOTIFY_SOCKET > /run/droid-hal/notify-socket-name

# Fix logcat spam
echo 1 > /sys/kernel/boot_adsp/boot
echo 1 > /sys/kernel/boot_cdsp/boot

# applying with systemd service
# echo deep > /sys/power/mem_sleep

# Use exec nohup since systemd may send SIGHUP, but droid-hal-init doesn't
# handle it. This avoids having to modify android_system_core, which would
# require different handling for every different android version.
exec nohup /sbin/droid-hal-init
