# All targets not defined in this Makefile, are passed down to build folder
# Requires GNU Make
# Source: https://gist.github.com/doitian/4978329


# Vars
# ====================
# NOTE: you can override make variable simply by adding VAR=VAL to the invocation

# List targets defined in this file
TARGETS_SELF := cmake flash
# Exclude targets defined in this file
TARGETS_OTHER := $(filter-out $(TARGETS_SELF), $(MAKECMDGOALS))

# tools
AVERDUDE= "$(AVR_ROOT)/avrdude"

# avrdude flags
HEX_FILE 	= ./bin/AVR_test_flow-atmega328p.hex
PORT		= COM5	
PART		= atmega328p
BAUDR		= 115200
PROGRAMMER	=arduino # this must be a programmer in avrdude.conf
AVRDUDE_FLAGS = -v -p $(PART) -c $(PROGRAMMER) -P $(PORT) -b $(BAUDR) -D -Uflash:w:$(HEX_FILE):i

# Rules
# ====================

# Call all targets using `Makefile` in build directory in one `make` command. It
# can depend on targets defined in this file, e.g., depending on a target to
# create the Makefile.
#
# If no targets are specified, use the dummy `all` target
$(or $(lastword $(TARGETS_OTHER)),all):
	$(MAKE) -C build $(TARGETS_OTHER)
.PHONY: $(TARGETS_OTHER) all

# Do nothing for all targets but last. Also quiet the message "Noting to be done on xxx"
$(filter-out $(lastword $(TARGETS_OTHER)), $(TARGETS_OTHER)):
	@cd .

.PHONY: cmake
cmake:
	cd build && cmake ../ -G "Unix Makefiles"

.PHONEY: flash
flash: 
	$(MAKE) -C build all
	@echo;
	@echo "Uploading $@";
	$(AVERDUDE) $(AVRDUDE_FLAGS)

