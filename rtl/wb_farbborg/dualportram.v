// a schreiben (8 Bit), b lesen (16 Bit)
module dualportram1(clka, clkb, wea, addra, addrb, dia, dob);
    input         clka;
    input         clkb;
    input         wea;
    input  [ 8:0] addra;
    input  [ 7:0] addrb;
    input  [ 7:0] dia;
    output [15:0] dob;
    reg    [ 7:0] RAM0 [255:0];
    reg    [ 7:0] RAM1 [255:0];
    reg    [ 7:0] read_addrb;
    reg    [ 8:0] help;
       
    initial begin
        for (help = 0; help < 256; help = help +1) begin
            if (help < 17) begin 
                RAM1[help] = 0;
                RAM0[help] = 17;
            end
            else begin
                RAM1[help] = 0;
                RAM0[help] = help;
                //{help[0],help[1],help[2],help[3],
                // help[4],help[5],help[6],help[7]};
            end
        end
    end
    
    always @(posedge clka)
    begin
        if (wea == 1'b1)
            if (addra[0] == 0)
                RAM0[addra[8:1]] <= dia;
            if (addra[0] == 1)
                RAM1[addra[8:1]] <= dia; 
    end
    
    always @(posedge clkb)
    begin
        read_addrb <= addrb;
    end
    
    assign dob = {RAM1[read_addrb], 
                  RAM0[read_addrb]};
endmodule

// a schreiben (8 Bit)make, b lesen (32 Bit)
module dualportram2(clka, clkb, wea, addra, addrb, dia, dob);
    input         clka;
    input         clkb;
    input         wea;
    input  [10:0] addra;
    input  [ 8:0] addrb;
    input  [ 7:0] dia;
    output [31:0] dob;
    reg    [ 7:0] RAM3 [511:0];
    reg    [ 7:0] RAM2 [511:0];
    reg    [ 7:0] RAM1 [511:0];
    reg    [ 7:0] RAM0 [511:0];
    reg    [ 8:0] read_addrb;
   
    initial begin 
        for (read_addrb = 0; read_addrb < 256; read_addrb = read_addrb +1) begin 
           RAM3[2*read_addrb] = 8'h10;
           RAM2[2*read_addrb] = 8'h20;
           RAM1[2*read_addrb] = 8'h30;
           RAM0[2*read_addrb] = 8'h40;
           RAM3[2*read_addrb+1] = 8'ha0;
           RAM2[2*read_addrb+1] = 8'hb5;
           RAM1[2*read_addrb+1] = 8'hc5;
           RAM0[2*read_addrb+1] = 8'hff;
        end
        read_addrb = 0;
    end
       
    always @(posedge clka)
    begin
        if (wea == 1'b1) 
        begin
            case (addra[1:0])
                2'b00 : RAM0[addra[10:2]] <= dia;
                2'b01 : RAM1[addra[10:2]] <= dia;
                2'b10 : RAM2[addra[10:2]] <= dia;
                2'b11 : RAM3[addra[10:2]] <= dia;
            endcase
        end 
    end
    
    always @(posedge clkb)
    begin
        read_addrb <= addrb;
    end
    
    assign dob = {RAM3[read_addrb],
                  RAM2[read_addrb],
                  RAM1[read_addrb], 
                  RAM0[read_addrb]};

endmodule
