# * libhi6210sft
# * Taken from P8 Lite device tree by XePeleato. All credits goes to him.
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	exif_patch.c \
	main.c \
	gui_patch.cpp \
	log_patch.c \
	camera_patch.c

LOCAL_SHARED_LIBRARIES := liblog libcutils libgui libbinder libutils
LOCAL_MULTILIB := both
LOCAL_MODULE := libhi6210sft
LOCAL_LDLIBS := -llog
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)