`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2018 04:44:32 PM
// Design Name: 
// Module Name: adder_array
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


module adder_array
(cmd,
ain0, ain1, ain2, ain3,
bin0, bin1, bin2, bin3, 
dout0, dout1, dout2, dout3,
overflow);

    input [2:0] cmd;
    input [31:0] ain0, ain1, ain2, ain3;
    input [31:0] bin0, bin1, bin2, bin3;
    output [31:0] dout0, dout1, dout2, dout3;
    output [3:0] overflow;
    
    wire [31:0] tempa[3:0];
    wire [31:0] tempb[3:0];
    wire [32:0] tempc[3:0];
    //reg [3:0] overflow;
    
    assign tempa[0] = ain0;
    assign tempa[1] = ain1;
    assign tempa[2] = ain2;
    assign tempa[3] = ain3;

    assign tempb[0] = bin0;
    assign tempb[1] = bin1;
    assign tempb[2] = bin2;
    assign tempb[3] = bin3;
    
    assign {overflow[0], dout0} = (cmd==0 || cmd==4) ? tempc[0] : 0;
    assign {overflow[1], dout1} = (cmd==1 || cmd==4) ? tempc[1] : 0;
    assign {overflow[2], dout2} = (cmd==2 || cmd==4) ? tempc[2] : 0;                             
    assign {overflow[3], dout3} = (cmd==3 || cmd==4) ? tempc[3] : 0;
     
    genvar i;
    generate for(i=0; i<4; i=i+1) begin: adder
        my_add add (
                .ain(tempa[i]),
                .bin(tempb[i]),
                .dout(tempc[i][31:0]),
                .overflow(tempc[i][32])
              );
    end endgenerate

endmodule
