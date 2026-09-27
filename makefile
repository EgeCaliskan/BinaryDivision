
include FPGAMakefile/makefile
DESIGN = 1
ifeq ($(DESIGN), 1)
	name := RightShiftRegister
	sources := RightShiftRegister.sv
else ifeq($(DESIGN), 2)
	name := LeftShiftRegister
	sources := LeftShiftRegister.sv
endif

