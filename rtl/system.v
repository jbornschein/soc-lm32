////////////////////////////////////////////////////////////////////
//
// LatticeMico 32 System
//

module system(
	input        clk, 
	input        reset_n,
	// Debug 
	output [3:0] led,
	input  [4:0] btn,
	// Uart
	input        uart_rxd, 
	output       uart_cts,
	output       uart_txd,
	input        uart_rts
);
	
assign uart_cts = 1;

/////////////////////////////////////////////////////////////////////
//
// Local wires
//
wire         rst   = ~reset_n;
wire         gnd   = 1'b0;
wire   [3:0] gnd4  = 4'h0;
wire  [31:0] gnd32 = 32'h00000000;

 
wire [31:0]  lm32i_adr,
             lm32d_adr,
             uart0_adr,
             bram0_adr;

wire [31:0]  lm32i_dat_r,
             lm32i_dat_w,
             lm32d_dat_r,
             lm32d_dat_w,
             uart0_dat_r,
             uart0_dat_w,
             bram0_dat_r,
             bram0_dat_w;

wire [3:0]   lm32i_sel,
             lm32d_sel,
             uart0_sel,
             bram0_sel;

wire         lm32i_i_we,
             lm32d_i_we,
             uart0_i_we,
             bram0_i_we;

wire         lm32i_cyc,
             lm32d_cyc,
             uart0_cyc,
             bram0_cyc;

wire         lm32i_stb,
             lm32d_stb,
             uart0_stb,
             bram0_stb;

wire         lm32i_ack,
             lm32d_ack,
             uart0_ack,
             bram0_ack;

wire         lm32i_rty,
             lm32d_rty,
             uart0_rty,
             bram0_rty;

wire         lm32i_err,
             lm32d_err,
             uart0_err,
             bram0_err;

wire         lm32i_lock,
             uart0_lock,
             lm32d_lock;

wire [2:0]   lm32i_cti,
             uart0_cti,
             lm32d_cti;

wire [1:0]   lm32i_bte,
             uart0_bte,
             lm32d_bte;

wire [31:0]  intr_n;
wire         uart0_intr;

assign intr_n = { 24'hFFFFFF, 7'b1111111, ~uart0_intr };
assign led    = { ~clk, ~rst, ~lm32i_stb, ~lm32i_ack };

/////////////////////////////////////////////////////////////////////
//
// Wishbone Interconnect
//

wb_conbus_top #(
	.s0_addr_w ( 4 ),
	.s0_addr   ( 4'h8 ),        // ddr0
	.s1_addr_w ( 4 ),
	.s1_addr   ( 4'h9 ),        // flash0
	.s27_addr_w( 16 ),
	.s2_addr   ( 16'h0000 ),    // bram0 
	.s3_addr   ( 16'hF000 ),    // uart0
	.s4_addr   ( 16'hF002 ),    // timer
	.s5_addr   ( 16'hF003 ),
	.s6_addr   ( 16'hF004 ),
	.s7_addr   ( 16'hF005 )
) conmax0 (
	.clk_i( clk ),
	.rst_i( rst ),
	// Master0
	.m0_dat_i(  lm32i_dat_w  ),
	.m0_dat_o(  lm32i_dat_r  ),
	.m0_adr_i(  lm32i_adr    ),
	.m0_we_i (  lm32i_we     ),
	.m0_sel_i(  lm32i_sel    ),
	.m0_cyc_i(  lm32i_cyc    ),
	.m0_stb_i(  lm32i_stb    ),
	.m0_ack_o(  lm32i_ack    ),
	.m0_rty_o(  lm32i_rty    ),
	.m0_err_o(  lm32i_err    ),
	// Master1
	.m1_dat_i(  lm32d_dat_w  ),
	.m1_dat_o(  lm32d_dat_r  ),
	.m1_adr_i(  lm32d_adr    ),
	.m1_we_i (  lm32d_we     ),
	.m1_sel_i(  lm32d_sel    ),
	.m1_cyc_i(  lm32d_cyc    ),
	.m1_stb_i(  lm32d_stb    ),
	.m1_ack_o(  lm32d_ack    ),
	.m1_rty_o(  lm32d_rty    ),
	.m1_err_o(  lm32d_err    ),
	// Master2
	.m2_dat_i(  gnd32  ),
	.m2_adr_i(  gnd32  ),
	.m2_sel_i(  gnd4   ),
	.m2_cyc_i(  gnd    ),
	.m2_stb_i(  gnd    ),
	// Master3
	.m3_dat_i(  gnd32  ),
	.m3_adr_i(  gnd32  ),
	.m3_sel_i(  gnd4   ),
	.m3_cyc_i(  gnd    ),
	.m3_stb_i(  gnd    ),
	// Master4
	.m4_dat_i(  gnd32  ),
	.m4_adr_i(  gnd32  ),
	.m4_sel_i(  gnd4   ),
	.m4_cyc_i(  gnd    ),
	.m4_stb_i(  gnd    ),
	// Master5
	.m5_dat_i(  gnd32  ),
	.m5_adr_i(  gnd32  ),
	.m5_sel_i(  gnd4   ),
	.m5_cyc_i(  gnd    ),
	.m5_stb_i(  gnd    ),
	// Master6
	.m6_dat_i(  gnd32  ),
	.m6_adr_i(  gnd32  ),
	.m6_sel_i(  gnd4   ),
	.m6_cyc_i(  gnd    ),
	.m6_stb_i(  gnd    ),
	// Master7
	.m7_dat_i(  gnd32  ),
	.m7_adr_i(  gnd32  ),
	.m7_sel_i(  gnd4   ),
	.m7_cyc_i(  gnd    ),
	.m7_stb_i(  gnd    ),

	// Slave0
	.s0_dat_i(  gnd32  ),
	.s0_ack_i(  gnd    ),
	.s0_err_i(  gnd    ),
	.s0_rty_i(  gnd    ),
	// Slave1
	.s1_dat_i(  gnd32  ),
	.s1_ack_i(  gnd    ),
	.s1_err_i(  gnd    ),
	.s1_rty_i(  gnd    ),
	// Slave2
	.s2_dat_i(  bram0_dat_r ),
	.s2_dat_o(  bram0_dat_w ),
	.s2_adr_o(  bram0_adr   ),
	.s2_sel_o(  bram0_sel   ),
	.s2_we_o(   bram0_we    ),
	.s2_cyc_o(  bram0_cyc   ),
	.s2_stb_o(  bram0_stb   ),
	.s2_ack_i(  bram0_ack   ),
	.s2_err_i(  gnd         ),
	.s2_rty_i(  gnd         ),
	// Slave3
	.s3_dat_i(  uart0_dat_r ),
	.s3_dat_o(  uart0_dat_w ),
	.s3_adr_o(  uart0_adr   ),
	.s3_sel_o(  uart0_sel   ),
	.s3_we_o(   uart0_we    ),
	.s3_cyc_o(  uart0_cyc   ),
	.s3_stb_o(  uart0_stb   ),
	.s3_ack_i(  uart0_ack   ),
	.s3_err_i(  uart0_err   ),
	.s3_rty_i(  uart0_rty   ),
	// Slave4
	.s4_dat_i(  gnd32  ),
	.s4_ack_i(  gnd    ),
	.s4_err_i(  gnd    ),
	.s4_rty_i(  gnd    ),
	// Slave5
	.s5_dat_i(  gnd32  ),
	.s5_ack_i(  gnd    ),
	.s5_err_i(  gnd    ),
	.s5_rty_i(  gnd    ),
	// Slave6
	.s6_dat_i(  gnd32  ),
	.s6_ack_i(  gnd    ),
	.s6_err_i(  gnd    ),
	.s6_rty_i(  gnd    ),
	// Slave7
	.s7_dat_i(  gnd32  ),
	.s7_ack_i(  gnd    ),
	.s7_err_i(  gnd    ),
	.s7_rty_i(  gnd    )
);


/////////////////////////////////////////////////////////////////////
// LM32 CPU 

lm32_cpu lm0 (
	.clk_i(  clk  ),
	.rst_i(  rst  ),
	.interrupt_n(  intr_n  ),
	//
	.I_ADR_O(  lm32i_adr    ),
	.I_DAT_I(  lm32i_dat_r  ),
	.I_DAT_O(  lm32i_dat_w  ),
	.I_SEL_O(  lm32i_sel    ),
	.I_CYC_O(  lm32i_cyc    ),
	.I_STB_O(  lm32i_stb    ),
	.I_ACK_I(  lm32i_ack    ),
	.I_WE_O (  lm32i_we     ),
	.I_CTI_O(  lm32i_cti    ),
	.I_LOCK_O( lm32i_lock   ),
	.I_BTE_O(  lm32i_bte    ),
	.I_ERR_I(  lm32i_err    ),
	.I_RTY_I(  lm32i_rty    ),
	//
	.D_ADR_O(  lm32d_adr    ),
	.D_DAT_I(  lm32d_dat_r  ),
	.D_DAT_O(  lm32d_dat_w  ),
	.D_SEL_O(  lm32d_sel    ),
	.D_CYC_O(  lm32d_cyc    ),
	.D_STB_O(  lm32d_stb    ),
	.D_ACK_I(  lm32d_ack    ),
	.D_WE_O (  lm32d_we     ),
	.D_CTI_O(  lm32d_cti    ),
	.D_LOCK_O( lm32d_lock   ),
	.D_BTE_O(  lm32d_bte    ),
	.D_ERR_I(  lm32d_err    ),
	.D_RTY_I(  lm32d_rty    )
);
	
/////////////////////////////////////////////////////////////////////
// Block RAM

wb_bram #(
	.mem_file_name( "../rtl/bram0.ram" )
) bram0 (
	.clk_i(  clk  ),
	.rst_i(  rst  ),
	//
	.wb_adr_i(  bram0_adr    ),
	.wb_dat_o(  bram0_dat_r  ),
	.wb_dat_i(  bram0_dat_w  ),
	.wb_sel_i(  bram0_sel    ),
	.wb_stb_i(  bram0_stb    ),
	.wb_cyc_i(  bram0_cyc    ),
	.wb_ack_o(  bram0_ack    ),
	.wb_we_i(   bram0_we     )
);


/////////////////////////////////////////////////////////////////////
// uart0
uart_core #(
	.CLK_IN_MHZ( 100 ),
	.BAUD_RATE( 576000 )
) uart0 (
	.CLK( clk ),
	.RESET( rst ),
	//
	.UART_ADR_I( uart0_adr ),
	.UART_DAT_I( uart0_dat_w ),
	.UART_DAT_O( uart0_dat_r ),
	.UART_STB_I( uart0_stb ),
	.UART_CYC_I( uart0_cyc ),
	.UART_WE_I(  uart0_we ),
	.UART_SEL_I( uart0_sel ),
	.UART_CTI_I( uart0_cti ),
	.UART_BTE_I( uart0_bte ),
	.UART_LOCK_I(uart0_lock ),
	.UART_ACK_O( uart0_ack ), 
	.UART_RTY_O( uart0_rty ),
	.UART_ERR_O( uart0_err ),
	.INTR(       uart0_intr ),
	.SIN(        uart_rxd ),
	.RXRDY_N(    uart0_rxrdy_n ),
	.SOUT(       uart_txd ),
	.TXRDY_N(    uart0_txrdy_n )
);

endmodule 
