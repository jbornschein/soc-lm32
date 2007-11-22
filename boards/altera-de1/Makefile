################################################################
# Project Configuration:
#
# Specify the name of the design (project) and compiler setting
# (csf) and the list of source files used.
################################################################
PROJECT = lm32
SOURCE_FILES = system.v
ASSIGNMENT_FILES = lm32.quartus lm32.psf lm32.csf

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
MAP_ARGS = --family=Cyclone2
FIT_ARGS = --part=EP1S20F484C6
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
	quartus_sh --tcl_eval project_new $(PROJECT) -overwrite

map.chg:
	$(STAMP)   map.chg

fit.chg:
	$(STAMP)   fit.chg

tan.chg:
	$(STAMP)   tan.chg

asm.chg:
	$(STAMP)   asm.chg

