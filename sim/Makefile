CVER=cver
GTKWAVE=gtkwave
IVERILOG=iverilog
VVP=vvp
	
sim: iverilog

####################################################################
# cver simulation
#cver:
#	$(CVER) +incdir+../rtl/wb_conbus+../rtl/wb_lm32 -f system_tb.list

####################################################################
# ikarus verilog simulation
system_tb.vvp: 
	$(IVERILOG) -o system_tb.vvp -I../rtl/wb_conbus -I../rtl/wb_lm32 -c system_tb.list

dualportram1_tb.vvp: 
	$(IVERILOG) -o dualportram1_tb.vvp -I../rtl/wb_farbborg -c dualportram1_tb.list

%.vcd: %.vvp
	$(VVP) $<


####################################################################
# other targets

view: system_tb.vcd
	$(GTKWAVE) system_tb.vcd system_tb.save
	
	
%.view: %.vcd
	$(GTKWAVE) $< $<.save

clean:
	rm -f *.vcd verilog.log *.vvp

