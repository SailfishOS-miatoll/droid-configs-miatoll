#/bin/sh

# Mount super.img partitions using parse-android-dynparts.
losetup -r /dev/loop0 /dev/sda17
dmsetup create --concise "$(parse-android-dynparts /dev/loop0)"
mkdir -p /system_root /system /vendor /product /system_ext /dsp /bt_firmware /persist /firmware /metadata /firmware_mnt /cache /data/cache

mount -o ro,barrier=1,discard  /dev/mapper/dynpart-system  /system_root
mount -o bind /system_root/system /system
mount -o ro,barrier=1,discard /dev/mapper/dynpart-product  /product
mount -o ro,barrier=1,discard /dev/mapper/dynpart-system_ext /system_ext
mount -o ro,barrier=1,discard /dev/mapper/dynpart-vendor  /vendor

# Others partitions mounting.
mount -v -o loop,ro,shortname=lower,uid=1000,gid=1000,dmask=227,fmask=337 -t vfat  /dev/sde4       /vendor/firmware_mnt
mount -v -o loop,ro,shortname=lower,uid=1002,gid=3002,dmask=227,fmask=337 -t vfat  /dev/sde5       /vendor/bt_firmware
mount -o noatime,nosuid,nodev,discard    /dev/sda12   /metadata
mount -o nosuid,noatime,nodev,barrier=1 /dev/block/bootdevice/by-name/cache /cache

# Binding mountpoints to sailfish used directories.
mount -o bind /vendor /system_root/vendor
mount -o bind /system_ext /system_root/system_ext
mount -o bind /product /system_root/product
mount -o bind /odm /system_root/odm

mount -o bind /vendor/firmware_mnt /firmware_mnt
mount -o bind /mnt/vendor/persist /persist
mount -o bind /cache /data/cache
mount -o bind /vendor/firmware /firmware
mount -o bind /vendor/bt_firmware /bt_firmware
mount -o bind /vendor/dsp /dsp


# Fix rfs drs
mount -o bind /vendor/firmware /vendor/rfs/msm/adsp/readonly/vendor/firmware/
mount -o bind /vendor/firmware_mnt /vendor/rfs/msm/adsp/readonly/firmware/
mount -o bind /vendor/firmware /vendor/rfs/msm/cdsp/readonly/vendor/firmware/
mount -o bind /vendor/firmware_mnt /vendor/rfs/msm/cdsp/readonly/firmware/
mount -o bind /vendor/firmware /vendor/rfs/msm/mpss/readonly/vendor/firmware/
mount -o bind /vendor/firmware_mnt /vendor/rfs/msm/mpss/readonly/firmware/
mount -o bind /vendor/firmware /vendor/rfs/msm/slpi/readonly/vendor/firmware/
mount -o bind /vendor/firmware_mnt /vendor/rfs/msm/slpi/readonly/firmware/

# Sound fix.
mount --bind /etc/audio_policy_configuration.xml /vendor/etc/audio_policy_configuration.xml
ln -s /usr/lib64/pulse-14.2/modules/libdroid-util.so /usr/lib64/pulseaudio/libdroid-util.so

# Fixed jail properties for HW codecs.
# mount --bind /etc/codec2.vendor.base.policy /vendor/etc/seccomp_policy/codec2.vendor.base.policy

# Fix stune errors
sh /usr/bin/droid/stune-fix.sh

