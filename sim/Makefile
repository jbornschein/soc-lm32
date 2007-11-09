CVER=cver
GTKWAVE=gtkwave
IVERILOG=iverilog
VVP=vvp
	
VINCDIR=                               \
	-I../rtl/wb_conbus                 \
	-I../rtl/lm32                      \
	-I../rtl/wb_ddr

SYSTEM_TB_SRC=                         \
	unisims/BUFG.v                     \
	unisims/DCM.v                      \
	unisims/FDDRRSE.v                  \
	ddr/ddr.v                          \
	system_tb.v                        \
	../rtl/system.v                    \
	../rtl/lac/lac.v                   \
	../rtl/lac/uart.v                  \
	../rtl/lac/dp_ram.v                \
	../rtl/lm32/lm32_cpu.v             \
	../rtl/lm32/lm32_instruction_unit.v	\
	../rtl/lm32/lm32_decoder.v         \
	../rtl/lm32/lm32_load_store_unit.v \
	../rtl/lm32/lm32_adder.v           \
	../rtl/lm32/lm32_addsub.v          \
	../rtl/lm32/lm32_logic_op.v        \
	../rtl/lm32/lm32_shifter.v         \
	../rtl/lm32/lm32_multiplier.v      \
	../rtl/lm32/lm32_mc_arithmetic.v   \
	../rtl/lm32/lm32_interrupt.v       \
	../rtl/lm32/lm32_icache.v          \
	../rtl/lm32/lm32_dcache.v          \
	../rtl/lm32/lm32_ram.v             \
	../rtl/wb_bram/wb_bram.v           \
	../rtl/wb_ddr/wb_ddr.v             \
	../rtl/wb_ddr/ddr_ctrl.v           \
	../rtl/wb_ddr/ddr_clkgen.v         \
	../rtl/wb_ddr/ddr_rpath.v          \
	../rtl/wb_ddr/ddr_wpath.v          \
	../rtl/wb_ddr/ddr_init.v           \
	../rtl/wb_ddr/ddr_pulse78.v        \
	../rtl/wb_ddr/async_fifo.v         \
	../rtl/wb_ddr/gray_counter.v       \
	../rtl/wb_ddr/dpram.v              \
	../rtl/wb_ddr/rotary.v             \
	../rtl/uart_core/intface.v         \
	../rtl/uart_core/modem.v           \
	../rtl/uart_core/rxcver.v          \
	../rtl/uart_core/txmitt.v          \
	../rtl/uart_core/uart_core.v       \
	../rtl/wb_conbus/wb_conbus_top.v   \
	../rtl/wb_conbus/wb_conbus_arb.v

all: system_tb.vcd

view: system_tb.view


####################################################################
# cver simulation
#cver:
#	$(CVER) +incdir+../rtl/wb_conbus+../rtl/wb_lm32 -f system_tb.list

####################################################################
# Ikarus verilog simulation

system_tb.vvp: $(SYSTEM_TB_SRC)
	rm -f $@.list
	@for i in `echo $^`; do \
	    echo $$i >> $@.list; \
	done
	$(IVERILOG) -o $@ $(VINCDIR) -c $@.list -s $(@:.vvp=)

dualportram1_tb.vvp: $(DUALPORTRAM1_TB_SRC)
	rm -f $@.list
	@for i in `echo $^`; do \
	    echo $$i >> $@.list; \
	done
	$(IVERILOG) -o $@ $(VINCDIR) -c $@.list -s $(@:.vvp=)

####################################################################
# final targets

%.vcd: %.vvp
	$(VVP) $<

%.view: %.vcd
	$(GTKWAVE) $< $<.save

clean:
	rm -f *.vcd verilog.log *.vvp *.vvp.list

