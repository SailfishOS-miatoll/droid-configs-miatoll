# Feel free to disable non-critical HA parts during devel by commenting lines out
# Generated in hadk by executing: rpm/dhd/helpers/add_new_device.sh

%package -n patterns-sailfish-device-adaptation-miatoll
Summary: Jolla HW Adaptation miatoll
Requires: droid-hal-miatoll
Requires: droid-hal-miatoll-img-boot
Requires: droid-hal-miatoll-kernel
Requires: droid-hal-miatoll-kernel-dtbo
Requires: droid-hal-miatoll-kernel-modules
Requires: droid-config-miatoll-sailfish
Requires: droid-config-miatoll-pulseaudio-settings
Requires: droid-config-miatoll-policy-settings
Requires: droid-config-miatoll-preinit-plugin
Requires: droid-config-miatoll-flashing
Requires: droid-config-miatoll-bluez5
Requires: droid-hal-version-miatoll
Requires: droid-hal-miatoll-detritus

# Hybris packages
Requires: libhybris-libEGL
Requires: libhybris-libGLESv2
Requires: libhybris-libwayland-egl
Requires: libhybris-libOpenCL
Requires: libhybris-libvibrator

# Bluetooth
Requires: bluebinder

# Fingerprint
Requires: sailfish-devicelock-fpd
Requires: sailfish-fpd-community
Requires: droid-biometry-fp
Obsoletes: jolla-devicelock-daemon-encpartition

# Telephony
Requires: ofono-binder-plugin
Requires: dummy_netd
Requires: modem_auto_config
Requires: ofono-vendor-qti-radio-plugin

# For torch
Requires: jolla-settings-system-flashlight

# For suspend to work with enabled Wi-Fi on newer Qualcomm devices
Requires: sailfish-connman-plugin-suspend

# Sensors
Requires: hybris-libsensorfw-qt5-binder

# Vibra
Requires: ngfd
Requires: libngf-qt5-qtfeedback

# Needed for /dev/touchscreen symlink
Requires: qt5-plugin-generic-evdev

Requires: pulseaudio-modules-droid
Requires: pulseaudio-modules-droid-hidl

# The -dummy-af is needed for newer devices that run the main
# audiosystem-passthrough in qti mode (e.g. >=Android 9 Qualcomm),
# to fix non-responding Camera app and/or voice during a phone call:
Requires: audiosystem-passthrough-dummy-af

# for audio recording to work:
Requires: qt5-qtmultimedia-plugin-mediaservice-gstmediacapture

# These need to be per-device due to differing backends (fbdev, eglfs, hwc, ..?)
Requires: qt5-qtwayland-wayland_egl
Requires: qt5-qpa-hwcomposer-plugin
Requires: qtscenegraph-adaptation

# Add GStreamer v1.0 as standard
Requires: gstreamer1.0
Requires: nemo-gstreamer1.0-interfaces
# For hybris devices with droidmedia, see HADK pdf for more information
Requires: gstreamer1.0-droid
Requires: gmp-droid
Provides: gecko-camera-droid-plugin

# This is needed for notification LEDs
Requires: mce-plugin-libhybris

# USB mode controller
Requires: usb-moded

# hammerhead, grouper, and maguro use this in scripts, so include for all
Requires: rfkill

# Enable home encryption
# Requires: droid-hwcrypt
# Requires: sailfish-device-encryption-community
# Requires: sailfish-device-encryption-community-droid

# For GPS
Requires: geoclue-provider-hybris

# NFC support
Requires: nfcd-binder-plugin

# Usb-Tethering
Requires: usb-moded-defaults-android
Requires: usb-moded-connection-sharing-android-connman-config

# wait_hwcomposer script
# Requires: libgbinder-tools

%description -n patterns-sailfish-device-adaptation-miatoll
Pattern with packages for miatoll HW Adaptation

%files -n patterns-sailfish-device-adaptation-miatoll
