#/bin/sh

# Move
if [ ! -d /system_root ]; then
    mv /system /system_root
    mv /system_root/vendor /vendor
    mv /system_root/system_ext /system_ext
    mv /system_root/product /product
fi

mkdir -p /system /persist /firmware /metadata /cache /data/cache /vendor/firmware_mnt /vendor/bt_firmware /vendor/dsp /mnt/vendor/persist

# Binding mountpoints to sailfish used directories.
mount -o bind /system_root/system /system

mount -o bind /vendor /system_root/vendor
mount -o bind /system_ext /system_root/system_ext
mount -o bind /product /system_root/product
mount -o bind /odm /system_root/odm

# Sound fix.
#mount --bind /etc/audio_policy_configuration.xml /vendor/etc/audio_policy_configuration.xml
#ln -s /usr/lib64/pulse-14.2/modules/libdroid-util.so /usr/lib64/pulseaudio/libdroid-util.so

# Fixed jail properties for HW codecs.
# mount --bind /etc/codec2.vendor.base.policy /vendor/etc/seccomp_policy/codec2.vendor.base.policy