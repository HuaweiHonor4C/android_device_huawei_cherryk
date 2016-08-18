# Prebuilt SELINUX (from EMUI B570 EU)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/file_contexts:root/file_contexts \
	$(LOCAL_PATH)/property_contexts:root/property_contexts \
	$(LOCAL_PATH)/seapp_contexts:root/seapp_contexts \
	$(LOCAL_PATH)/selinux_version:root/selinux_version \
	$(LOCAL_PATH)/sepolicy:root/sepolicy \
	$(LOCAL_PATH)/service_contexts:root/service_contexts