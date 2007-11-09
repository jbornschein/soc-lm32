`timescale 1 ns / 100 ps

module system_tb;

parameter tck = 10;

reg        clk;
reg        reset;
reg  [4:0] btn;
wire [3:0] led;
wire       uart_rxd;
wire       uart_txd;

system dut  (
	.clk(       clk   ),
	.reset_n(  ~reset ),
	// Debug
	.led(       led   ),
	.btn(       btn   ),
	// Uart
	.uart_rxd(  uart_rxd  ),
	.uart_txd(  uart_txd  )
);

/* Clocking device */
always #(tck/2) clk = ~clk;

/* Simulation setup */
initial begin
	$dumpvars(-1, dut);
	$dumpfile("system_tb.vcd");

	// reset
	reset  = 1;
	clk    = 0;
        
	#(tck*3)
	reset  = 0;
	$display("RESET DONE");

	#(tck*50000) $finish;
end

always @(posedge clk)
begin
	if (dut.lm32d_ack) begin
		$display( " lm32_d transaction: adr=%h  we=%b", dut.lm32d_adr, dut.lm32d_we );
	end
end









endmodule
