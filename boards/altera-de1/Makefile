################################################################
# Project Configuration:
#
# Specify the name of the design (project) and compiler setting
# (csf) and the list of source files used.
################################################################
PROJECT = system
SOURCE_FILES =	                              \
	system.v                              \
	../../rtl/lac/lac.v                   \
	../../rtl/lac/uart.v                  \
	../../rtl/lac/dp_ram.v                \
	../../rtl/lm32/lm32_cpu.v             \
	../../rtl/lm32/lm32_instruction_unit.v	\
	../../rtl/lm32/lm32_decoder.v         \
	../../rtl/lm32/lm32_load_store_unit.v \
	../../rtl/lm32/lm32_adder.v           \
	../../rtl/lm32/lm32_addsub.v          \
	../../rtl/lm32/lm32_logic_op.v        \
	../../rtl/lm32/lm32_shifter.v         \
	../../rtl/lm32/lm32_multiplier.v      \
	../../rtl/lm32/lm32_mc_arithmetic.v   \
	../../rtl/lm32/lm32_interrupt.v       \
	../../rtl/lm32/lm32_icache.v          \
	../../rtl/lm32/lm32_dcache.v          \
	../../rtl/lm32/lm32_ram.v             \
	../../rtl/wb_bram/wb_bram.v           \
	../../rtl/wb_uart/wb_uart.v           \
	../../rtl/wb_timer/wb_timer.v         \
	../../rtl/wb_conbus/wb_conbus_top.v   \
	../../rtl/wb_conbus/wb_conbus_arb.v   \
	../../rtl/wb_sram/wb_sram32.v


#ASSIGNMENT_FILES = system.quartus system.psf system.csf
ASSIGNMENT_FILES = system.psf system.csf

#system.prj: $(SOURCE_FILES) $(SYN_SRC)
#	rm -f system.prj
#	@for i in `echo $^`; do \
#	    echo "set_global_assignment -name VERILOG_FILE $$i" >> system.prj; \
#	done


################################################################
# Main Targets
# 
# all: build everything
# clean: remove output files and database
# clean_all: removes settings files as well as clean.
################################################################
all: smart.log $(PROJECT).asm.rpt $(PROJECT).tan.rpt

clean:
	rm -rf *.rpt *.chg smart.log *.htm *.eqn *.pin *.sof *.pof db
clean_all: clean
	rm -rf *.ssf *.csf *.esf *.fsf *.psf *.quartus *.qws

map: smart.log $(PROJECT).map.rpt
fit: smart.log $(PROJECT).fit.rpt
asm: smart.log $(PROJECT).asm.rpt
tan: smart.log $(PROJECT).tan.rpt
smart: smart.log

################################################################
# Executable Configuration
################################################################
MAP_ARGS = --family="Cyclone II"
FIT_ARGS = --part=EP2C20F484C7
ASM_ARGS =
TAN_ARGS =

################################################################
# Target implementations
################################################################
STAMP = echo done >

$(PROJECT).map.rpt: map.chg $(SOURCE_FILES)
	quartus_map $(MAP_ARGS) $(PROJECT)
	$(STAMP) fit.chg

$(PROJECT).fit.rpt: fit.chg $(PROJECT).map.rpt
	quartus_fit $(FIT_ARGS) $(PROJECT)
	$(STAMP) asm.chg
	$(STAMP) tan.chg

$(PROJECT).asm.rpt: asm.chg $(PROJECT).fit.rpt
	quartus_asm $(ASM_ARGS) $(PROJECT)

$(PROJECT).tan.rpt: tan.chg $(PROJECT).fit.rpt
	quartus_tan $(TAN_ARGS) $(PROJECT)

smart.log: $(ASSIGNMENT_FILES)
	quartus_sh --determine_smart_action $(PROJECT) > smart.log

################################################################
# Project initialization
################################################################
$(ASSIGNMENT_FILES):
	touch system.quartus
#	quartus_sh --tcl_eval project_new $(PROJECT) -overwrite

map.chg:
	$(STAMP)   map.chg

fit.chg:
	$(STAMP)   fit.chg

tan.chg:
	$(STAMP)   tan.chg

asm.chg:
	$(STAMP)   asm.chg

