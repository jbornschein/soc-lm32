module system_tb;

parameter tck = 10;

reg        clk;
reg  [3:0] btn;
wire [7:0] led;
wire       uart_rx;
wire       uart_tx;

system dut  (
	.clk(  clk  ),
	// Debug
	.led(  led  ),
	.btn(  btn  ),
	// Uart
	.uart_rx(  uart_rx  ),
	.uart_tx(  uart_tx  )
);


/* Clocking device */
always #(tck/2) clk = ~clk;

/* Simulation setup */
initial begin
	$dumpvars(-1, dut);
	$dumpfile("system_tb.vcd");
//	$readmemh(`TEST_FILE, rom.ram);

        // reset
	btn[0] = 1;
	clk    = 0;
        
	#(tck*3)
	btn[0] = 0;
	$display("RESET DONE");

	#(tck*500) $finish;
end

endmodule