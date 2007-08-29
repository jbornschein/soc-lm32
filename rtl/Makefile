
##
SYNCLEAN=system.bgn system.drc system.mrp system.ngd system.pcf 
SYNCLEAN+=system.bld system.lso system.ncd system.ngm system.srp
SYNCLEAN+=system.bit system_signalbrowser.* system-routed_pad.tx
SYNCLEAN+=system.map system_summary.xml timing.twr
SYNCLEAN+=system-routed* system_usage* system.ngc param.opt netlist.lst

system_tb.vcd: *.v system_tb.list
	cver +incdir+wb_conbus+wb_lm32 -f system_tb.list

view: system_tb.vcd
	gtkwave system_tb.vcd system_tb.save

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

syn: system.ngc system.bit

synclean: 
	rm -f $(SYNCLEAN)
	rm -Rf xst



#############################################################################
# General targets
clean:
	rm -f *.vcd verilog.log
	
