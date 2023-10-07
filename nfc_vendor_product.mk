# Enable build support for NFC open source vendor modules
ifeq ($(strip $(TARGET_USES_ST_AIDL_NFC)),true)
ST_VENDOR_NFC += android.hardware.nfc-service.st
else
ST_VENDOR_NFC += android.hardware.nfc@1.2-service.st
endif
ST_VENDOR_NFC += nfc_nci.st21nfc.default

ifeq ($(strip $(TARGET_USES_ST_NFC) $(TARGET_USES_ST_AIDL_NFC)),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml

ifeq ($(strip $(TARGET_USES_ST_AIDL_NFC)),true)
ifeq ($(TARGET_NFC_SKU),)
ST_VENDOR_NFC += nfc-service-default.xml
endif
endif

PRODUCT_PACKAGES += $(ST_VENDOR_NFC)
endif