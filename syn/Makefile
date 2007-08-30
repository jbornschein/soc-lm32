
##
XSTCLEAN=system.bgn system.drc system.mrp system.ngd system.pcf 
XSTCLEAN+=system.bld system.lso system.ncd system.ngm system.srp
XSTCLEAN+=system.bit system_signalbrowser.* system-routed_pad.tx
XSTCLEAN+=system.map system_summary.xml timing.twr
XSTCLEAN+=system-routed* system_usage* system.ngc param.opt netlist.lst
XSTCLEAN+=xst

syn: system.bit


#############################################################################
# Synthesis
system.ngc:
	xst -ifn system.xst

system.ngd: system.ngc
	ngdbuild -uc system.ucf system.ngc

system.ncd: system.ngd
	map system.ngd

system-routed.ncd: system.ncd
	par -ol high -w system.ncd system-routed.ncd

system.bit: system-routed.ncd
	bitgen -w system-routed.ncd system.bit

clean: 
	rm -Rf $(XSTCLEAN)

