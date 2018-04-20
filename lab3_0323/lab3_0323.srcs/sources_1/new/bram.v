`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2018 03:17:15 PM
// Design Name: 
// Module Name: bram
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


module bram #(
    parameter integer BRAM_ADDR_WIDTH = 6, // 2**6 = 4x16   
    parameter INIT_FILE = "/csehome/sdu6342/Downloads/lab3/input.txt",
    parameter OUT_FILE = "/csehome/sdu6342/Downloads/lab3/output.txt"
)(
input wire [BRAM_ADDR_WIDTH-1:0] BRAM_ADDR,
input wire BRAM_CLK,
input wire [31:0] BRAM_WRDATA,
output reg [31:0] BRAM_RDDATA,
input wire BRAM_EN,
input wire BRAM_RST,
input wire [3:0] BRAM_WE,
input wire done
);

reg [31:0] mem[0:15];
wire [BRAM_ADDR_WIDTH-3:0] addr = BRAM_ADDR[BRAM_ADDR_WIDTH-1:2]; // Word Address
reg [31:0] dout;

initial begin
if (INIT_FILE != "") begin
$readmemh(INIT_FILE, mem);
end
wait(done)
$writememh(OUT_FILE, mem);
$display("Dump to output file");
end
// code for BRAM implementation

integer i;

always @( posedge BRAM_CLK, negedge BRAM_RST) begin
    if(!BRAM_RST) begin
        for (i=0; i< 2 ** (BRAM_ADDR_WIDTH-2); i = i+1) begin
            mem[i] = {32{1'b0}};
        end
        BRAM_RDDATA = {32{1'b0}};
    end
    else if(BRAM_EN) begin
        BRAM_RDDATA <= dout;
        if(BRAM_WE == 4'b0000) begin 
            dout <= mem[addr];
        end
        else begin
            for(i = 0; i < 4; i = i +1 ) begin 
                if (BRAM_WE[i]) begin
                    mem[addr][8*i +: 8] <= BRAM_WRDATA[8*i +: 8];
                end
            end
            dout <= dout;
        end
    end
end

endmodule