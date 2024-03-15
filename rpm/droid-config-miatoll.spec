# These and other macros are documented in ../droid-configs-device/droid-configs.inc
# Feel free to cleanup this file by removing comments, once you have memorised them ;)

%define device miatoll
%define vendor xiaomi

%define vendor_pretty Xiaomi
%define device_pretty Redmi Note 9 Pro

%define dcd_path ./

%define android_version_major 11

# Community HW adaptations need this
%define community_adaptation 1

# We assume most devices will
%define have_modem 1

# Sailfish OS is considered to-scale, if in the App Grid you get 4-in-a-row icons,
# and 2-in-a-row or 3-in-a-row app covers in the Home Screen, depending on
# how many apps are open.
# For 4-5.5" device screen sizes of 16:9 ratio, use this formula (hold portrait):
# pixel_ratio = 4.5/DiagonalDisplaySizeInches * HorizontalDisplayResolution/540
# Other screen sizes and ratios will require more trial-and-error.
%define pixel_ratio 1.3

# Device-specific ofono configuration
Provides: ofono-configs
Obsoletes: ofono-configs-mer

Provides: usb-moded-configs

%define ofono_enable_plugins bluez5,hfp_ag_bluez5
%define ofono_disable_plugins bluez4,dun_gw_bluez4,hfp_ag_bluez4,hfp_bluez4,dun_gw_bluez5,hfp_bluez5

%include droid-configs-device/droid-configs.inc
%include patterns/patterns-sailfish-device-adaptation-miatoll.inc
%include patterns/patterns-sailfish-device-configuration-miatoll.inc

# IMPORTANT if you want to comment out any macros in your .spec, delete the %
# sign, otherwise they will remain defined! E.g.:
#define some_macro "I'll not be defined because I don't have % in front"

