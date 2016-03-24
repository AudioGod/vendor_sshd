PRODUCT_BRAND ?= SSHD

# Boot animation
PRODUCT_COPY_FILES += \
	vendor/sshd/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip
	
# SSHD init.rc
PRODUCT_COPY_FILES += \
	vendor/sshd/prebuilt/common/etc/init.sshd.rc:root/init.sshd.rc

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Proprietary latinime libs needed for Keyboard swyping
ifneq ($(filter arm64,$(TARGET_ARCH)),)
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif

# by default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false
	
# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0	

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

# Embed SuperUser
#SUPERUSER_EMBEDDED := true

# Backup Tool
ifneq ($(WITH_GMS),true)
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/sshd/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/sshd/prebuilt/common/bin/50-sshd.sh:system/addon.d/50-sshd.sh \
    vendor/sshd/prebuilt/common/bin/blacklist:system/addon.d/blacklist
endif

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/bin/otasigcheck.sh:system/bin/otasigcheck.sh

# userinit support
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
	
# init.d support
PRODUCT_COPY_FILES += \
	vendor/sshd/prebuilt/common/bin/sysinit:system/bin/sysinit \
	vendor/sshd/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# Camera Effects
 ifneq ($(filter sshd_flo sshd_flounder sshd_hammerhead sshd_shamu,$(TARGET_PRODUCT)),)
 PRODUCT_COPY_FILES +=  \
    vendor/sshd/prebuilt/common/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/sshd/prebuilt/common/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
endif 

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties	
	
# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl	

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni	

# Chain fire SuperSU
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/supersu/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/sshd/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon
	
# Layers Manager
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/LayersManager/LayersManager-N-fixed-debug.apk:system/app/LayersManager/LayersManager-N-fixed-debug.apk.apk
	
#SSHD Fonts
PRODUCT_COPY_FILES += \
    vendor/sshd/prebuilt/common/fonts/Roboto-Black.ttf:system/fonts/Roboto-Black.ttf \
    vendor/sshd/prebuilt/common/fonts/Roboto-BlackItalic.ttf:system/fonts/Roboto-BlackItalic.ttf \
    vendor/sshd/prebuilt/common/fonts/Roboto-Bold.ttf:system/fonts/Roboto-Bold.ttf \
    vendor/sshd/prebuilt/common/fonts/Roboto-BoldItalic.ttf:system/fonts/Roboto-BoldItalic.ttf \
    vendor/sshd/prebuilt/common/fonts/RobotoCondensed-Bold.ttf:system/fonts/RobotoCondensed-Bold.ttf \
    vendor/sshd/prebuilt/common/fonts/RobotoCondensed-BoldItalic.ttf:system/fonts/RobotoCondensed-BoldItalic.ttf \
    vendor/sshd/prebuilt/common/fonts/RobotoCondensed-Italic.ttf:system/fonts/RobotoCondensed-Italic.ttf \
    vendor/sshd/prebuilt/common/fonts/RobotoCondensed-Light.ttf:system/fonts/RobotoCondensed-Light.ttf \
	vendor/sshd/prebuilt/common/fonts/RobotoCondensed-LightItalic.ttf:system/fonts/RobotoCondensed-LightItalic.ttf \
    vendor/sshd/prebuilt/common/fonts/RobotoCondensed-Regular.ttf:system/fonts/RobotoCondensed-Regular.ttf \
    vendor/sshd/prebuilt/common/fonts/Roboto-Italic.ttf:system/fonts/Roboto-Italic.ttf \
    vendor/sshd/prebuilt/common/fonts/Roboto-Light.ttf:system/fonts/Roboto-Light.ttf \
    vendor/sshd/prebuilt/common/fonts/Roboto-LightItalic.ttf:system/fonts/Roboto-LightItalic.ttf \
    vendor/sshd/prebuilt/common/fonts/Roboto-Medium.ttf:system/fonts/Roboto-Medium.ttf \
    vendor/sshd/prebuilt/common/fonts/Roboto-MediumItalic.ttf:system/fonts/Roboto-MediumItalic.ttf \	
    vendor/sshd/prebuilt/common/fonts/Roboto-Regular.ttf:system/fonts/Roboto-Regular.ttf \
	vendor/sshd/prebuilt/common/fonts/Roboto-Thin.ttf:system/fonts/Roboto-Thin.ttf \
	vendor/sshd/prebuilt/common/fonts/Roboto-ThinItalic.ttf:system/fonts/Roboto-ThinItalic.ttf
 
# Required SSHD packages
PRODUCT_PACKAGES += \
	BluetoothExt \
	Development \
	Launcher3 \
	SonicLauncher \
	ExactCalculator \
	libemoji \
	Terminal \
	SpareParts \
	Eleven
   		
# Extra tools in SSHD
PRODUCT_PACKAGES += \
    Busybox \
	libsepol \
    mke2fs \
    tune2fs \
    nano \
    htop \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    pigz

WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# rsync
PRODUCT_PACKAGES += \
    rsync

# These packages are excluded from user builds
#ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su
#endif
	
# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so
	
# SSHD overlays
PRODUCT_PACKAGE_OVERLAYS := vendor/sshd/overlay/common

# easy way to extend to add more packages
$(call prepend-product-if-exists, vendor/extra/product.mk)

# SSHD Prop Tweaks & Fixes.
-include vendor/sshd/config/sshd_prop.mk

# SSHD Versioning
-include vendor/sshd/config/version.mk
