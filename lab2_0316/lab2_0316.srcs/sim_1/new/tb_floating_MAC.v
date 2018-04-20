`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2018 04:17:29 PM
// Design Name: 
// Module Name: tb_floating_MAC
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


module tb_floating_MAC();

reg[32-1:0] ain;
reg[32-1:0] bin;
reg[32-1:0] cin;
reg rst;
reg clk;
wire [32-1:0] res_fp;
wire dvalid;


initial begin 
    clk<=0;
    rst<=0;
    ain<='h3e19999a;
    bin<='h3e4ccccd;
    cin<='h40400000;
    
    #100 ain= 'h7fcccccd;
    bin = 0;
    cin = 'h32000000;
end

always #5 clk = ~clk;

floating_point_MAC fpUUT(
    .aclk(clk),
    .aresetn(~rst),
    .s_axis_a_tvalid(1'b1),
    .s_axis_b_tvalid(1'b1),
    .s_axis_c_tvalid(1'b1),
    .s_axis_a_tdata(ain),
    .s_axis_b_tdata(bin),
    .s_axis_c_tdata(cin),
    .m_axis_result_tvalid(dvalid),
    .m_axis_result_tdata(res_fp)
);

endmodule
