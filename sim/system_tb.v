`timescale 1 ns / 100 ps

module system_tb;

parameter tck = 20;

reg        clk;
reg        reset;
wire [3:0] btn;
wire [3:0] sw;
wire [7:0] led;

//------------------------------------------------------------------
// UART STUFF (testbench uart, simulating a comm. partner)
//------------------------------------------------------------------
wire       uart_rxd;
wire       uart_txd;

reg          tx_wr;
wire         tx_busy;
reg    [7:0] tx_data;

wire   [7:0] rx_data;
wire         rx_avail;
reg          rx_ack;

uart #(
	.freq_hz( 50000000  ),
	.baud(      115200  )
) tb_uart (
	.reset(    reset     ),
	.clk(      clk       ),
	//
	.uart_txd( uart_rxd  ),
	.uart_rxd( uart_txd  ),
	//
	.rx_data(  rx_data   ),
	.rx_avail( rx_avail  ),
	.rx_error( rx_error  ),
	.rx_ack(   rx_ack    ),
	.tx_data(  tx_data   ),
	.tx_wr(    tx_wr     ),
	.tx_busy(  tx_busy   )
);

//------------------------------------------------------------------
// uart helper function
//------------------------------------------------------------------
always @(posedge clk)
begin
	if (rx_avail && ~rx_ack) begin
		$display( "Reading from UART: rx_data=%h", rx_data );
		rx_ack <= 1;
	end else 
		rx_ack <= 0;
end

task uart_send;
	input [7:0] byte;
	begin
		while (tx_busy) begin
			@(posedge clk);
		end

		@(negedge clk);
		$display( "Writing to UART: tx_data=%h", byte );

		tx_data = byte;
		tx_wr   = 1;
		#(tck)
		tx_wr   = 0;
	end
endtask

task uart_wait_tx;
	begin
		while (tx_busy) begin
			@(posedge clk);
		end

		$display( "Writing to UART: done." );
	end
endtask

//------------------------------------------------------------------
// Decive Under Test 
//------------------------------------------------------------------
system dut  (
	.clk(  clk  ),
	// Debug
	.led(  led  ),
	.btn(  btn  ),
	.sw(   sw   ),
	// Uart
	.uart_rxd(  uart_rxd  ),
	.uart_txd(  uart_txd  )
);

assign btn = { 3'b0, reset };
assign sw  = { 4'b1 };


/* Clocking device */
always #(tck/2) clk = ~clk;

/* Simulation setup */
initial begin
	$dumpvars(-1, dut);
	$dumpfile("system_tb.vcd");

	// reset
	clk    = 0;
	reset  = 1;
        
	#(tck*3)
	reset  = 0;
	$display("reset done");
	
	// send CMD_DISARM
	uart_send( 'h02 );
	uart_wait_tx;
	#(tck*5000)

	// send CMD_ARM
	uart_send( 'h01 );
	uart_wait_tx;
	#(tck*5000)

	// send select value
	uart_send( 'h00 );
	uart_wait_tx;
	#(tck*5000)

	// send trigger mask
	uart_send( 'hFF );
	uart_wait_tx;
	#(tck*5000)

	// send trigger comop
	uart_send( 'h80 );
	uart_wait_tx;
	#(tck*5000)

	// send pretrigger value
	uart_send( 'h00 );
	uart_wait_tx;
	#(tck*5000)

	#(tck*200000) $finish;
end

//------------------------------------------------------------------
// Monitor Wishbone transactions
//------------------------------------------------------------------
always @(posedge clk)
begin
	if (dut.lm32d_ack) begin
		$display( "LM32D transaction: ADR=%x WE=%b DAT=%x", 
		            dut.lm32d_adr, dut.lm32d_we, 
		            (dut.lm32d_we) ? dut.lm32d_dat_w : dut.lm32d_dat_r );
	end
end

endmodule
