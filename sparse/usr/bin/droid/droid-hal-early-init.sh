#/bin/sh

mkdir -p /metadata
mount -o noatime,nosuid,nodev,discard    /dev/sda12   /metadata

# Sound fix.
ln -s /usr/lib64/pulse-14.2/modules/libdroid-util.so /usr/lib64/pulseaudio/libdroid-util.so
# Make pulseaudio happy!
mount --bind /vendor/lib64/libqtigef.so /vendor/lib/libqtigef.so
mount --bind /vendor/lib64/soundfx/libqcompostprocbundle.so /vendor/lib/soundfx/libqcompostprocbundle.so
mount --bind /vendor/lib64/soundfx/libqcomvisualizer.so /vendor/lib/soundfx/libqcomvisualizer.so

sh /usr/bin/droid/stune-fix.sh
