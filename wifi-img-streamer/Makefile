io=uart
PMSIS_OS = freertos

ifeq ($(SETUP_WIFI_AP), 1)
APP_CFLAGS += -DSETUP_WIFI_AP
endif

PROJECTFOLDER = $(shell pwd)
APP = wifi-img-streamer
APP_SRCS += wifi-img-streamer.c ../lib/cpx/src/com.c ../lib/cpx/src/cpx.c
APP_CFLAGS += -O3 -g
APP_INC=../lib/cpx/inc
APP_CFLAGS += -DconfigUSE_TIMERS=1 -DINCLUDE_xTimerPendFunctionCall=1
CFLAGS += -I$(PROJECTFOLDER)/micro_xrce_dds_install/include
LDFLAGS += -L$(PROJECTFOLDER)/micro_xrce_dds_install/lib -lmicroxrcedds_client -lmicrocdr

CONFIG_GAP_LIB_JPEG = 1

RUNNER_CONFIG = $(CURDIR)/config.ini


include $(RULES_DIR)/pmsis_rules.mk

# Micro_Xrce_DDS

BUILD_DIR = $(PROJECTFOLDER)/build
C_INCLUDES += -I$(PROJECTFOLDER)/micro_xrce_dds_install/include

	# Micro XRCE-DDS Agent address
CFLAGS += -DUXRCEDDS_AGENT_IP=\"$(UXRCEDDS_AGENT_IP)\" -DUXRCEDDS_AGENT_PORT=\"$(UXRCEDDS_AGENT_PORT)\"

libmicroxrcedds: gap_riscv_toolchain_ubuntu_18
	cd $(PROJECTFOLDER)/../Micro-XRCE-DDS-Client; rm -rf build; mkdir build; cd build; \
	export PATH=/gap_riscv_toolchain_ubuntu_18/bin:$$PATH; \
	cmake .. CROSS_COMPILE=riscv32-unknown-elf- && make install;

OBJECTS += $(PROJECTFOLDER)/micro_xrce_dds_install/lib/libmicroxrcedds_client.a
OBJECTS += $(PROJECTFOLDER)/micro_xrce_dds_install/lib/libmicrocdr.a
