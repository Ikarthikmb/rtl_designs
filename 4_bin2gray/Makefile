TOPLEVEL_LANG ?= verilog

PWD=$(shell pwd)

export PYTHONPATH := $(PWD)/../model:$(PYTHONPATH)

ifeq ($(TOPLEVEL_LANG), verilog)
    VERILOG_SOURCES =$(PWD)/bin2gray.v
else 
    $(error A valid value (verilog) was not provided for TOPLEVEL_LANG=$(TOPLEVEL_LANG))
endif

TOPLEVEL := bin2gray
MODULE := tb_bin2gray

include $(shell cocotb-config --makefiles)/Makefile.sim
