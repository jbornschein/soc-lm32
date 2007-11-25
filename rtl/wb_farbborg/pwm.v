// Farborg PWM Anteuerung
module pwm (
    reset,	  
    cp2, 		  
    addr,		  
    din,		  
    we,		  
    clk,		  
    lsr_clr,	  
    lsr_d,	  
    lsr_c,	  
    latch_data, 
    psr_c, 	  
    psr_d,	  
    col_enable 
);   

input             reset;
input             cp2;
input  [10:0]     addr;
input  [ 7:0]     din;
input             we;
input             clk;
output            lsr_clr;
output reg        lsr_d;
output            lsr_c;
output reg [ 7:0] latch_data;
output reg        psr_c;
output reg        psr_d;
output reg        col_enable;

reg    [7:0] ledstatus [15:0];
reg   [15:0] pwmtable [255:0];

wire   [8:0] address;
reg    [2:0] planecount;
reg    [3:0] latchcount;

reg    [7:0] pwmcount;
reg    [7:0] newpwmcount;

wire  [15:0] pwmdata;
wire  [10:0] br3_adr;
wire   [7:0] br3_adrb;

wire         we_br3;
wire  [10:0] addr_br;

wire         we_br1;
wire         we_br2;

reg          lsr_clk_en;
reg          trigger;
reg   [15:0] delaycnt;
wire  [63:0] line;

reg   [ 5:0] i;
reg   [ 8:0] a;
reg   [ 8:0] b;

reg   pwm_enable;

assign address = {2'b00, planecount, latchcount};
assign lsr_c   = ~clk & lsr_clk_en;
assign lsr_clr = ~reset;

assign addr_br  = {2'b 00,addr[9:3] ,addr[1:0] };
assign we_br1   = (( ~addr[10] )) & (( ~addr[2] )) & we;
assign we_br2   = (( ~addr[10] )) & addr[2]  & we;
assign br3_adrb = newpwmcount;
assign br3_adr  = {1'b0, addr[9:0]};
assign we_br3   = addr[10] & we;

always @(posedge clk or posedge reset) begin
    if (reset == 1'b 1) begin
        delaycnt    <= 16'h0000;
        pwmcount    <= 8'b00000000;
        newpwmcount <= 8'b00000000;
        planecount  <= 3'b000;
        trigger     <= 1'b0;
        psr_d       <= 1'b0;
        psr_c       <= 1'b0;
        col_enable  <= 1'b1;
    end else begin
        trigger     <= 1'b0;
        delaycnt    <= delaycnt - 1;
        if (pwm_enable == 1'b0) begin
            col_enable <= 1'b1;
        end
        if (delaycnt == 16'h0000) begin
            delaycnt    <= pwmdata;
            pwmcount    <= newpwmcount;
            newpwmcount <= newpwmcount + 1;
            trigger     <= 1'b1;
            psr_c <= 1'b0;
            if (newpwmcount == 8'b00000000) begin
                psr_c <= 1'b1;
                if (pwm_enable == 1'b1) begin
                    col_enable <= 1'b0;
                end
            end
            
            if (newpwmcount == 8'b11111111) begin
                planecount <= planecount + 1;
                $display("newpwmcount = 11111111");
                
                if (planecount == 3'b100) begin
                     psr_d <= 1'b1;
                     $display("planecount == 3'b100");
                     planecount <= 3'b000;
                end else
                     psr_d <= 1'b0;
            end
        end
    end
end

always @(posedge clk or posedge reset) begin
    if (reset == 1'b 1) begin
        latchcount <= 4'b1011;
        lsr_clk_en <= 1'b0;
    end
    else begin
        lsr_d      <= 1'b0;
        latchcount <= latchcount + 1;
        
        if (latchcount == 4'b0001) begin
            lsr_d      <= 1'b1;
            lsr_clk_en <= 1'b1;
        end
        
        if (latchcount == 4'b1011) begin
          lsr_clk_en <= 1'b0;
          latchcount <= 4'b1011;
          if (trigger == 1'b1) begin
              latchcount <= 4'b0000;
          end
        end
        
        latch_data <= ledstatus[latchcount];
        if (pwmcount == 8'h00) begin
          ledstatus[latchcount] <= 8'hff;
        end
 
        if (pwmcount < line[(8*8)-1:(7*8)]) begin
            latch_data[7] <= 1'b1;
        end else begin
            latch_data[7] <= 1'b0;
        end
        if (pwmcount == line[(7*8)-1:(6*8)]) begin
            latch_data[6] <= 1'b1;
        end else begin
            latch_data[6] <= 1'b0;
        end       
        if (pwmcount == line[(6*8)-1:(5*8)]) begin
            latch_data[5] <= 1'b1;
        end else begin
            latch_data[5] <= 1'b0;
        end
        if (pwmcount == line[(5*8)-1:(4*8)]) begin
            latch_data[4] <= 1'b1;
        end else begin
            latch_data[4] <= 1'b0;
        end
        if (pwmcount == line[(4*8)-1:(3*8)]) begin
            latch_data[3] <= 1'b1;
        end else begin
            latch_data[3] <= 1'b0;
        end
        if (pwmcount == line[(3*8)-1:(2*8)]) begin
            latch_data[2] <= 1'b1;
        end else begin
            latch_data[2] <= 1'b0;
        end
        if (pwmcount == line[(2*8)-1:(1*8)]) begin
            latch_data[1] <= 1'b1;
        end else begin
            latch_data[1] <= 1'b0;
        end
        if (pwmcount == line[(1*8)-1:0]) begin
            latch_data[0] <= 1'b1;
        end else begin
            latch_data[0] <= 1'b0;
        end
    end
end

always @(posedge cp2 or posedge reset) begin
    if (reset == 1'b1) begin
        pwm_enable <= 1'b0;
    end else begin
        if (we == 1'b 1) begin
            if (addr[10]  == 1'b1)
                pwm_enable <= 1'b0; //disable pwm when user accesse pwm table
            if (addr == {3'b111, 8'h55})  //0xE755
                if (din == 8'h23)
                    pwm_enable <= 1'b1;
        end
    end
end

dualportram1 dpr1 (
        .clka(cp2), 
        .clkb(clk), 
        .wea(we_br3), 
        .addra(br3_adr[8:0]), 
        .addrb(br3_adrb), 
        .dia(din), 
        .dob(pwmdata)
);

dualportram2 dpr21 (
        .clka(cp2), 
        .clkb(clk), 
        .wea(we_br1), 
        .addra(br3_adr), 
        .addrb(address), 
        .dia(din), 
        .dob(line[31:0])
);

dualportram2 dpr22 (
        .clka(cp2), 
        .clkb(clk), 
        .wea(we_br2), 
        .addra(br3_adr), 
        .addrb(address), 
        .dia(din), 
        .dob(line[63:32])
);

endmodule
