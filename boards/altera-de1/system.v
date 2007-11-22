module system(
	input clk,
	input reset,
	output [7:0] led
)

assign led[7:1] = 'b0;
assign led[0]   = reset;

endmodule
