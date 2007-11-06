
///////////////////////////////////////////////////////////////////
//
// Wishbone DDR Controller
// 
// (c) Joerg Bornschein (<jb@capsec.org>)
//

`include "ddr_include.v"

module ddr_wb
(
	input                    clk,
	input                    reset,
	// Wishbone Slave
	input  [`WB_ADR_RNG]     wb_adr_i,
	input  [`WB_DAT_RNG]     wb_dat_i,
	output [`WB_DAT_RNG]     wb_dat_o,
	input  [`WB_SEL_RNG]     wb_sel_i,
	input                    wb_cyc_i,
	input                    wb_stb_i,
	input                    wb_we_i,
	output                   wb_ack_o,
	// Request DDR read operation
//	output reg               rd_req,
//	output reg [31:4]        rd_adr,
//	input      [31:0]        rd_dat,
//	input                    rd_ack
	// Request DDR write operation
	output reg               wr_req,
	output     [31:4]        wr_adr,
	output     [31:0]        wr_dat,
	output     [ 3:0]        wr_val,
	input                    wr_ack
);

// Buffer Cache
wire           cache_wr;
wire  [31:4]   cache_adr;
wire [127:0]   cache_dat;
wire  [15:0]   cache_val;
wire           cache_ack;


// Buffer 
reg  [31:4] buf_adr;
reg [127:0] buf_dat;
reg  [15:0] buf_val;
reg         buf_dirty;
wire        buf_flush;
  
wire [1:0]  wb_mux_sel = wb_adr_i[3:2];
wire [31:4] wb_wadr    = wb_adr_i[31:4];

assign      buf_flush = buf_dirty & (wb_wadr != buf_adr) & wb_stb_i & wb_cyc_i;

/////////////////////////////////////////////////////////////////////////////
// MUX Buffer for WB read cycle
assign wb_dat_o     = (wb_mux_sel == 2'b00 ) ? buf_dat[ 31: 0] :
                      (wb_mux_sel == 2'b01 ) ? buf_dat[ 63:32] :
                      (wb_mux_sel == 2'b10 ) ? buf_dat[ 95:64] :
                      (wb_mux_sel == 2'b10 ) ? buf_dat[ 95:64] :
                                               buf_dat[127:96];
//                      (wb_mux_sel == 2'b11 ) ? buf_dat[127:96];

assign wb_dat_o_val = (wb_mux_sel == 2'b00 ) ? buf_val[ 3: 0] :
                      (wb_mux_sel == 2'b01 ) ? buf_val[ 7: 4] :
                      (wb_mux_sel == 2'b01 ) ? buf_val[11: 8] :
                                               buf_val[15:12];

/////////////////////////////////////////////////////////////////////////////
// ACKenpoledge Wishbone 
reg wb_ack_reg;

wire   write_buf = wb_stb_i & wb_cyc_i &  wb_we_i & ~wb_ack_reg & ((buf_adr == wb_wadr) | ~buf_dirty);
wire   read_buf  = wb_stb_i & wb_cyc_i & ~wb_we_i & ~wb_ack_reg & ((~wb_dat_o_val && wb_sel_i) == 4'b0000) ;

assign wb_ack_o  = (write_buf | read_buf);

always @(posedge clk or posedge reset)
begin
	if (reset) 
		wb_ack_reg <= 0;
	else
		wb_ack_reg <= wb_ack_o;
end

/////////////////////////////////////////////////////////////////////////////
// Write Request from Wishbone

always @(posedge clk or posedge reset)
begin
	if (reset) begin
		buf_dirty = 0;
		buf_val   = 'b0;
		buf_adr   = 'b0;
	end else begin
		if (buf_flush & cache_ack) begin
			buf_dirty = 'b0;
//			buf_val   = 'b0;
//			buf_adr   = 'b0;   //  NOT NEEDED
//			buf_dat   = 'b0;   //  NOT NEEDED
		end

		if (write_buf) begin
			buf_dirty = 1;
			buf_adr   = wb_wadr;

			case (wb_mux_sel)
			2'b00 : begin
				buf_dat[ 31:  0] = wb_dat_i;
				buf_val[  3:  0] = wb_sel_i;
			end
			2'b01: begin
				buf_dat[ 63: 32] = wb_dat_i;
				buf_val[  7:  4] = wb_sel_i;
			end
			2'b10: begin
				buf_dat[ 95: 64] = wb_dat_i;
				buf_val[ 11:  8] = wb_sel_i;
			end
			2'b11: begin
				buf_dat[127: 96] = wb_dat_i;
				buf_val[ 15: 12] = wb_sel_i;
			end
			endcase

		end
	end
end


/////////////////////////////////////////////////////////////////////////////
// Write to buffer cache

assign cache_wr  = buf_flush;
assign cache_adr = buf_adr;
assign cache_dat = buf_dat;
assign cache_val = buf_val;

// cache ACK is handled by buf_data block



/////////////////////////////////////////////////////////////////////////////
// buffer cache implementation

reg  [32:0]    cache_adr_reg;
reg [127:0]    cache_dat_reg;
reg  [15:0]    cache_val_reg;

reg            cache_busy;
reg   [1:0]    wr_mux;

assign cache_ack = cache_wr & ~cache_busy;

always @(posedge clk or posedge reset)
begin
	if (reset) begin
		wr_req     <= 0;
		wr_mux     <= 0;
		cache_busy <= 0;
	end else begin
		if (cache_ack) begin
			cache_busy    <= 1;
			wr_req        <= 1;
			wr_mux        <= 0;
			cache_adr_reg <= cache_adr;
			cache_dat_reg <= cache_dat;
			cache_val_reg <= cache_val;
		end

		if (cache_busy & wr_req & wr_ack)
			wr_mux <= wr_mux + 1;

		if (cache_busy & wr_ack & (wr_mux == 'b11)) begin
			cache_busy <= 0;
			wr_req     <= 0;
		end
	end
end

assign wr_adr    = cache_adr_reg;
assign wr_dat    = (wr_mux == 2'b00 ) ? cache_dat_reg[ 31: 0] :
                   (wr_mux == 2'b01 ) ? cache_dat_reg[ 63:32] :
                   (wr_mux == 2'b10 ) ? cache_dat_reg[ 95:64] :
                                        cache_dat_reg[127:96];
                                            
assign wr_val    = (wr_mux == 2'b00 ) ? cache_val_reg[ 3: 0] :
                   (wr_mux == 2'b01 ) ? cache_val_reg[ 7: 4] :
                   (wr_mux == 2'b10 ) ? cache_val_reg[11: 8] :
                                        cache_val_reg[15:12];

endmodule
