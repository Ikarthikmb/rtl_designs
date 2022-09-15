TOPLEVEL_LANG ?= verilog

PWD=$(shell pwd)

export PYTHONPATH := $(PWD)/../model:$(PYTHONPATH)

ifeq ($(TOPLEVEL_LANG), verilog)
    VERILOG_SOURCES =$(PWD)/adder2bit.v
else 
    $(error A valid value (verilog) was not provided for TOPLEVEL_LANG=$(TOPLEVEL_LANG))
endif

TOPLEVEL := adder2bit
MODULE := tb_adder2bit

include $(shell cocotb-config --makefiles)/Makefile.sim
