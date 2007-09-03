CVER=cver
GTKWAVE=gtkwave
IVERILOG=iverilog
VVP=vvp
	
sim: iverilog

####################################################################
# cver simulation
cver:
	$(CVER) +incdir+../rtl/wb_conbus+../rtl/wb_lm32 -f system_tb.list

####################################################################
# ikarus verilog simulation
system_tb.vvp: 
	$(IVERILOG) -o system_tb.vvp -I../rtl/conbus -I../rtl/wb_lm32 -c system_tb.list

iverilog: system_tb.vvp
	$(VVP) system_tb.vvp

####################################################################
# other targets

view: system_tb.vcd
	$(GTKWAVE) system_tb.vcd system_tb.save

clean:
	rm -f *.vcd verilog.log system_tb.vvp
	

