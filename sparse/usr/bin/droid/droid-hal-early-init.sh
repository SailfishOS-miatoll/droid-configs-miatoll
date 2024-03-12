#/bin/sh

mv /system /system_root
mkdir -p /vendor /system /product /system_ext /dsp /bt_firmware /persist /firmware /metadata /firmware_mnt /cache /data/cache

mount -o bind /system_root/system /system

mount --bind /usr/libexec/droid-hybris/system/lib64 /odm/lib64

# Others partitions mounting.
mount -v -o loop,ro,shortname=lower,uid=1000,gid=1000,dmask=227,fmask=337 -t vfat  /dev/sde4       /vendor/firmware_mnt
mount -v -o loop,ro,shortname=lower,uid=1002,gid=3002,dmask=227,fmask=337 -t vfat  /dev/sde5       /vendor/bt_firmware
mount -o noatime,nosuid,nodev,discard    /dev/sda12   /metadata
mount -o nosuid,noatime,nodev,barrier=1 /dev/block/bootdevice/by-name/cache /cache

# Binding mountpoints to sailfish used directories.
mount -o bind /system_root/vendor /vendor
mount -o bind /system_root/system_ext /system_ext
mount -o bind /system_root/product /product
mount -o bind /odm /system_root/odm

mount -o bind /vendor/firmware_mnt /firmware_mnt
mount -o bind /mnt/vendor/persist /persist
mount -o bind /cache /data/cache
mount -o bind /vendor/firmware /firmware
mount -o bind /vendor/bt_firmware /bt_firmware
mount -o bind /vendor/dsp /dsp

# Shittyfixes
#touch /odm/lib64/libicui18n.so
#touch /odm/lib64/libandroidicu.so
#touch /odm/lib64/libicuuc.so
#mount --bind /apex/com.android.art/lib64/libandroidicu.so /odm/lib64/libandroidicu.so
#mount --bind /apex/com.android.art/lib64/libicuuc.so /odm/lib64/libicuuc.so
#mount --bind /apex/com.android.art/lib64/libicui18n.so /odm/lib64/libicui18n.so

# Sound fix.
#mount --bind /etc/audio_policy_configuration.xml /vendor/etc/audio_policy_configuration.xml
#ln -s /usr/lib64/pulse-14.2/modules/libdroid-util.so /usr/lib64/pulseaudio/libdroid-util.so

# Fixed jail properties for HW codecs.
# mount --bind /etc/codec2.vendor.base.policy /vendor/etc/seccomp_policy/codec2.vendor.base.policy

# Fix stune errors
#sh /usr/bin/droid/stune-fix.sh