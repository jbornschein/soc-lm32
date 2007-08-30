CVER=cver
GTKWAVE=gtkwave

system_tb.vcd: *.v system_tb.list
	$(CVER) +incdir+../rtl/wb_conbus+../rtl/wb_lm32 -f system_tb.list

view: system_tb.vcd
	$(GTKWAVE) system_tb.vcd system_tb.save

clean:
	rm -f *.vcd verilog.log
	
