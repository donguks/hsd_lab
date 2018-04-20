`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2018 03:50:15 PM
// Design Name: 
// Module Name: bram_bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bram_bench();
   parameter BRAM_ADDR_WIDTH = 6;
   reg [BRAM_ADDR_WIDTH-1:0] BRAM_ADDR, prev_addr;
   reg BRAM_CLK;
   reg BRAM_EN;
   reg BRAM_RST;
   reg [3:0] BRAM_WE_1, BRAM_WE_0;
   reg done;
   wire [31:0] READ_DATA;

bram #() READ(
   .BRAM_ADDR(BRAM_ADDR),
   .BRAM_CLK(BRAM_CLK),
   .BRAM_RDDATA(READ_DATA),
   .BRAM_EN(BRAM_EN),
   .BRAM_RST(BRAM_RST),
   .BRAM_WE(BRAM_WE_0)
);

bram #(6, "", "/csehome/sdu6342/Downloads/lab3/output.txt") WRITE(
   .BRAM_ADDR(prev_addr),
   .BRAM_CLK(BRAM_CLK),
   .BRAM_WRDATA(READ_DATA),
   .BRAM_EN(BRAM_EN),
   .BRAM_RST(BRAM_RST),
   .BRAM_WE(BRAM_WE_1),
   .done(done)
);

integer i;

initial begin
    BRAM_CLK <= 1'b0;
    BRAM_EN <= 1;
    BRAM_WE_1 <= 4'b1111;
    BRAM_WE_0 <= 4'b0000;
    BRAM_ADDR <= {BRAM_ADDR_WIDTH{1'b0}};
    done <= 0;
    //BRAM_RST = 1'b1;
    for (i = 0; i < 17 ; i = i +1 ) begin
        #10
        prev_addr <= BRAM_ADDR - 4;
        BRAM_ADDR <= BRAM_ADDR + 4;
    end
  
    #10 done = 1;
    #20 $stop;
end


always begin
    #5 BRAM_CLK = ~BRAM_CLK;
end

endmodule
