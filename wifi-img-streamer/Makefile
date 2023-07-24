io=uart
PMSIS_OS = freertos

ifeq ($(SETUP_WIFI_AP), 1)
APP_CFLAGS += -DSETUP_WIFI_AP
endif

PROJECTFOLDER = $(shell pwd)
APP = wifi-img-streamer
APP_SRCS += wifi-img-streamer.c ../lib/cpx/src/com.c ../lib/cpx/src/cpx.c
APP_CFLAGS += -O3 -g
APP_INC=../lib/cpx/inc Micro-XRCE-DDS-Client/include
APP_CFLAGS += -DconfigUSE_TIMERS=1 -DINCLUDE_xTimerPendFunctionCall=1
CFLAGS +=-I$(PROJECTFOLDER)/micro_xrce_dds_install/include
LDFLAGS +=-L$(PROJECTFOLDER)/micro_xrce_dds_install/lib -lmicroxrcedds_client -lmicrocdr

CONFIG_GAP_LIB_JPEG = 1

RUNNER_CONFIG = $(CURDIR)/config.ini


include $(RULES_DIR)/pmsis_rules.mk

# Micro_Xrce_DDS

BUILD_DIR = $(PROJECTFOLDER)/Micro-XRCE-DDS-Client/build
C_INCLUDES +=-I$(PROJECTFOLDER)/micro_xrce_dds_install/include
C_INCLUDES +=-I$(PROJECTFOLDER)

	# Micro XRCE-DDS Agent address
CFLAGS +=-DUXRCEDDS_AGENT_IP=\"$(UXRCEDDS_AGENT_IP)\" -DUXRCEDDS_AGENT_PORT=\"$(UXRCEDDS_AGENT_PORT)\"

$(info    Ciao il mio nome è albano)

libmicroxrcedds:
	cd $(PROJECTFOLDER)/Micro-XRCE-DDS-Client; rm -rf build; mkdir build; cd build; \
	export PATH=/gap_riscv_toolchain_ubuntu_18/bin:$$PATH; \
	cmake .. -DCMAKE_INSTALL_PREFIX=$(PROJECTFOLDER)/micro_xrce_dds_install && make && make install;

OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
OBJECTS += $(PROJECTFOLDER)/micro_xrce_dds_install/lib/libmicroxrcedds_client.a
OBJECTS += $(PROJECTFOLDER)/micro_xrce_dds_install/lib/libmicrocdr.a

vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR)
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@

$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@

$(BUILD_DIR):
	mkdir $@

#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)
