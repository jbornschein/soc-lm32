////////////////////////////////////////////////////////////////////
//
// LatticeMico 32 System
//

module system(
	clk, 
	// Debug 
	led,
	btn,
	// Uart
	uart_rx, 
	uart_tx
);
	
////////////////////////////////////////////////////////////////////
//
// Module IOs
//

input        clk;

output [7:0] led;
input  [3:0] btn;

input        uart_rx;
output       uart_tx;


/////////////////////////////////////////////////////////////////////
//
// Local wires
//

wire         rst;
wire         gnd;

assign rst = btn[0];
assign gnd = 1'b0;

 
wire [31:0]  lm32i_adr,
             lm32d_adr,
             bram0_adr;

wire [31:0]  lm32i_dat_r,
             lm32i_dat_w,
             lm32d_dat_r,
             lm32d_dat_w,
             bram0_dat_r,
             bram0_dat_w;

wire [3:0]   lm32i_sel,
             lm32d_sel,
             bram0_sel;

wire         lm32i_cyc,
             lm32d_cyc,
             bram0_cyc;

wire         lm32i_stb,
             lm32d_stb,
             bram0_stb;

wire         lm32i_ack,
             lm32d_ack,
             bram0_ack;

wire         lm32i_rty,
             lm32d_rty,
             bram0_rty;

wire         lm32i_err,
             lm32d_err,
             bram0_err;

wire         lm32i_lock,
             lm32d_lock;

wire [2:0]   lm32i_cti,
             lm32d_cti;

wire [1:0]   lm32i_bte,
             lm32d_bte;

/////////////////////////////////////////////////////////////////////
//
// Wishbone Interconnect
//

wb_conmax_top #(32,
                32,
                4'hf,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2,
                2'd2
) conmax0 (
	.clk_i( clk ),
	.rst_i( rst ),
	// Master0
	.m0_data_i(  lm32i_dat_w  ),
	.m0_data_o(  lm32i_dat_r  ),
	.m0_addr_i(  lm32i_adr    ),
	.m0_sel_i(   lm32i_sel    ),
	.m0_cyc_i(   lm32i_cyc    ),
	.m0_stb_i(   lm32i_stb    ),
	.m0_ack_o(   lm32i_ack    ),
	.m0_rty_o(   lm32i_rty    ),
	.m0_err_o(   lm32i_err    ),
	// Master1
	.m1_data_i(  lm32d_dat_w  ),
	.m1_data_o(  lm32d_dat_r  ),
	.m1_addr_i(  lm32d_adr    ),
	.m1_sel_i(   lm32d_sel    ),
	.m1_cyc_i(   lm32d_cyc    ),
	.m1_stb_i(   lm32d_stb    ),
	.m1_ack_o(   lm32d_ack    ),
	.m1_rty_o(   lm32d_rty    ),
	.m1_err_o(   lm32d_err    ),
	// Master2
	.m2_data_i(  gnd  ),
	.m2_addr_i(  gnd  ),
	.m2_sel_i(   gnd  ),
	.m2_cyc_i(   gnd  ),
	.m2_stb_i(   gnd  ),
	// Master3
	.m3_data_i(  gnd  ),
	.m3_addr_i(  gnd  ),
	.m3_sel_i(   gnd  ),
	.m3_cyc_i(   gnd  ),
	.m3_stb_i(   gnd  ),
	// Master4
	.m4_data_i(  gnd  ),
	.m4_addr_i(  gnd  ),
	.m4_sel_i(   gnd  ),
	.m4_cyc_i(   gnd  ),
	.m4_stb_i(   gnd  ),
	// Master5
	.m5_data_i(  gnd  ),
	.m5_addr_i(  gnd  ),
	.m5_sel_i(   gnd  ),
	.m5_cyc_i(   gnd  ),
	.m5_stb_i(   gnd  ),
	// Master6
	.m6_data_i(  gnd  ),
	.m6_addr_i(  gnd  ),
	.m6_sel_i(   gnd  ),
	.m6_cyc_i(   gnd  ),
	.m6_stb_i(   gnd  ),
	// Master7
	.m7_data_i(  gnd  ),
	.m7_addr_i(  gnd  ),
	.m7_sel_i(   gnd  ),
	.m7_cyc_i(   gnd  ),
	.m7_stb_i(   gnd  ),

	// Slave0
	.s0_data_i(  bram0_data_r ),
	.s0_data_o(  bram0_data_w ),
	.s0_addr_o(  bram0_addr   ),
	.s0_sel_o(   bram0_sel    ),
	.s0_we_o(    bram0_we     ),
	.s0_cyc_o(   bram0_cyc    ),
	.s0_stb_o(   bram0_stb    ),
	.s0_ack_i(   bram0_ack    ),
	.s0_err_i(   gnd         ),
	.s0_rty_i(   gnd         ),
	// Slave0
	.s0_data_i(  gnd  ),
	.s0_ack_i(   gnd  ),
	.s0_err_i(   gnd  ),
	.s0_rty_i(   gnd  ),
	// Slave1
	.s1_data_i(  gnd  ),
	.s1_ack_i(   gnd  ),
	.s1_err_i(   gnd  ),
	.s1_rty_i(   gnd  ),
	// Slave2
	.s2_data_i(  gnd  ),
	.s2_ack_i(   gnd  ),
	.s2_err_i(   gnd  ),
	.s2_rty_i(   gnd  ),
	// Slave3
	.s3_data_i(  gnd  ),
	.s3_ack_i(   gnd  ),
	.s3_err_i(   gnd  ),
	.s3_rty_i(   gnd  ),
	// Slave4
	.s4_data_i(  gnd  ),
	.s4_ack_i(   gnd  ),
	.s4_err_i(   gnd  ),
	.s4_rty_i(   gnd  ),
	// Slave5
	.s5_data_i(  gnd  ),
	.s5_ack_i(   gnd  ),
	.s5_err_i(   gnd  ),
	.s5_rty_i(   gnd  ),
	// Slave6
	.s6_data_i(  gnd  ),
	.s6_ack_i(   gnd  ),
	.s6_err_i(   gnd  ),
	.s6_rty_i(   gnd  ),
	// Slave7
	.s7_data_i(  gnd  ),
	.s7_ack_i(   gnd  ),
	.s7_err_i(   gnd  ),
	.s7_rty_i(   gnd  ),
	// Slave8
	.s8_data_i(  gnd  ),
	.s8_ack_i(   gnd  ),
	.s8_err_i(   gnd  ),
	.s8_rty_i(   gnd  ),
	// Slave9
	.s9_data_i(  gnd  ),
	.s9_ack_i(   gnd  ),
	.s9_err_i(   gnd  ),
	.s9_rty_i(   gnd  ),
	// Slave10
	.s10_data_i(  gnd  ),
	.s10_ack_i (  gnd  ),
	.s10_err_i (  gnd  ),
	.s10_rty_i (  gnd  ),
	// Slave11
	.s10_data_i(  gnd  ),
	.s11_ack_i (  gnd  ),
	.s11_err_i (  gnd  ),
	.s11_rty_i (  gnd  ),
	// Slave12
	.s12_data_i(  gnd  ),
	.s12_ack_i (  gnd  ),
	.s12_err_i (  gnd  ),
	.s12_rty_i (  gnd  ),
	// Slave13
	.s13_data_i(  gnd  ),
	.s13_ack_i (  gnd  ),
	.s13_err_i (  gnd  ),
	.s13_rty_i (  gnd  ),
	// Slave14
	.s14_data_i(  gnd  ),
	.s14_ack_i (  gnd  ),
	.s14_err_i (  gnd  ),
	.s14_rty_i (  gnd  ),
	// Slave15
	.s15_data_i(  gnd  ),
	.s15_ack_i (  gnd  ),
	.s15_err_i (  gnd  ),
	.s15_rty_i (  gnd  )
);


/////////////////////////////////////////////////////////////////////
// LM32 CPU 

lm32_cpu cpu0 (
	.clk_i(  clk  ),
	.rst_i(  rst  ),
	.interrupt_n(  intr_n  ),
	//
	.i_adr_o(  lm32i_adr    ),
	.i_dat_i(  lm32i_dat_r  ),
	.i_dat_o(  lm32i_dat_r  ),
	.i_sel_o(  lm32i_sel    ),
	.i_cyc_o(  lm32i_cyc    ),
	.i_stb_o(  lm32i_stb    ),
	.i_ack_i(  lm32i_ack    ),
	.i_we_o (  lm32i_we     ),
	.i_cti_o(  lm32i_cti    ),
	.i_lock_o( lm32i_lock   ),
	.i_bte_o(  lm32i_bte    ),
	.i_err_i(  lm32i_err    ),
	.i_rty_i(  lm32i_rty    ),
	//
	.d_adr_o(  lm32d_adr    ),
	.d_dat_i(  lm32d_dat_r  ),
	.d_dat_o(  lm32d_dat_r  ),
	.d_sel_o(  lm32d_sel    ),
	.d_cyc_o(  lm32d_cyc    ),
	.d_stb_o(  lm32d_stb    ),
	.d_ack_i(  lm32d_ack    ),
	.d_we_o (  lm32d_we     ),
	.d_cti_o(  lm32d_cti    ),
	.d_lock_o( lm32d_lock   ),
	.d_bte_o(  lm32d_bte    ),
	.d_err_i(  lm32d_err    ),
);
	
/////////////////////////////////////////////////////////////////////
// Block RAM

wb_bram bram0 (
	.clk_i(  clk  ),
	.rst_i(  rst  ),
	//
	.wb_adr_i(  bram0_adr_i  ),
	.wb_dat_o(  bram0_dat_o  ),
	.wb_dat_i(  bram0_dat_i  ),
	.wb_sel_i(  bram0_sel_i  ),
	.wb_stb_i(  bram0_stb_i  ),
	.wb_cyc_i(  bram0_cyc_i  ),
	.wb_ack_o(  bram0_ack_o  ),
	.wb_we_i(   bram0_we_i   )
);

endmodule 
