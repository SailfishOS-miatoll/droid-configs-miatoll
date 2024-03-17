#/bin/sh

mv /system /system_root
mkdir -p /system /vendor /product /system_ext /metadata

# Binding mountpoints to sailfish used directories.

mount -o bind /system_root/system /system 
mount -o bind /system_root/vendor /vendor
mount -o bind /system_root/system_ext /system_ext
mount -o bind /system_root/product /product
mount -o bind /odm /system_root/odm

mount -o noatime,nosuid,nodev,discard    /dev/sda12   /metadata

mkdir -p /vendor/firmware_mnt /vendor/bt_firmware /vendor/dsp
mount -o ro,nosuid,nodev,barrier=1  /dev/sde9   /vendor/dsp
mount -o ro,shortname=lower,uid=1000,gid=1000,dmask=227,fmask=337  /dev/sde4       /vendor/firmware_mnt
mount -o ro,shortname=lower,uid=1002,gid=3002,dmask=227,fmask=337  /dev/sde5       /vendor/bt_firmware

# Sound fix.
mount --bind /etc/audio_policy_configuration.xml /vendor/etc/audio_policy_configuration.xml
ln -s /usr/lib64/pulse-14.2/modules/libdroid-util.so /usr/lib64/pulseaudio/libdroid-util.so

# Fixed jail properties for HW codecs.
# mount --bind /etc/codec2.vendor.base.policy /vendor/etc/seccomp_policy/codec2.vendor.base.policy