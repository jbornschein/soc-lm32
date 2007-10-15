///////////////////////////////////////////////////////////////////
//
// Wishbone BlockRAM
//

module wb_bram #(
	parameter mem_file_name = "none"
) (
	clk_i, 
	rst_i,
	//
	wb_adr_i,
	wb_dat_o,
	wb_dat_i,
	wb_sel_i,
	wb_stb_i,
	wb_cyc_i,
	wb_ack_o,
	wb_we_i
);

input         clk_i, rst_i;

input  [31:0] wb_adr_i;
input  [31:0] wb_dat_i; 
output [31:0] wb_dat_o; 
reg    [31:0] wb_dat_o; 
input   [3:0] wb_sel_i; 
input         wb_stb_i,
              wb_cyc_i,
              wb_we_i;

output        wb_ack_o;


///////////////////////////////////////////////////////////////////
// Local 
reg  [31:0] ram [0:2047];    // actual RAM
reg         ack;
wire [10:0] addr;


assign addr = wb_adr_i[12:2];       // 0..2047
assign wb_ack_o = wb_stb_i & ack;


always @(posedge clk_i)
begin
	if (wb_stb_i && wb_cyc_i) 
	begin
		if (wb_we_i) 
			ram[ addr ] <= wb_dat_i;

		wb_dat_o <= ram[ addr ];
		ack <= ~ack;
	end else
		ack <= 0;
    
end

initial 
begin
	if (mem_file_name != "none")
	begin
		$readmemh(mem_file_name, ram);
	end
end

endmodule
