SHELL=/bin/sh
TARGET?=$(shell uname -m)
LIBDIR?=lib
LOCALLIB?="../../lib"
VERBOSE?=0
ifeq ($(VERBOSE), 1)
AT=
else
AT=@
endif
TRIPLE=x86_64-linux
ifeq ($(TARGET), aarch64)
TRIPLE=aarch64-linux
endif
ifeq ($(TARGET), qnx)
TRIPLE=qnx-linux
endif
ifeq ($(TARGET), android32)
TRIPLE=arm-linux-androideabi
endif
ifeq ($(TARGET), android64)
TRIPLE=aarch64-linux-android
endif
export TARGET
export VERBOSE
export LIBDIR
export TRIPLE
export LOCALLIB
sources=src
.PHONY: all clean help test test_debug test_release
all: 
	$(AT)$(foreach source,$(sources), $(MAKE) -C $(source);)

clean:
	$(AT)$(foreach source,$(sources), $(MAKE) clean -C $(source);)

test: test_debug test_release

test_debug:
	$(AT)$(foreach source,$(sources), $(MAKE) test_debug -C $(source);)

test_release:
	$(AT)$(foreach source,$(sources), $(MAKE) test_release -C $(source);)

help:
	$(AT)echo "Source building help menu."
	$(AT)echo "Sources:"
	$(AT)$(foreach source,$(sources), echo "\t$(source)";)
	$(AT)echo "\nCommands:"
	$(AT)echo "\tall - build all sources."
	$(AT)echo "\tclean - clean all sources."
	$(AT)echo "\ttest[_debug|_release] - test all/release/debug sources."
	$(AT)echo "\nVariables:"
	$(AT)echo "\tTARGET - Specify the target to build for."
	$(AT)echo "\tVERBOSE - Specify verbose output."
	$(AT)echo "\tCUDA_INSTALL_DIR - Directory where cuda installs to."

