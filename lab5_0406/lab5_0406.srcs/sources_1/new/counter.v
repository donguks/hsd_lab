`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2018 04:02:55 PM
// Design Name: 
// Module Name: counter
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


module counter(
        input clk,
        input rst,
        output reg [7:0] LD
    );
    
    reg [26:0] count;
    
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            count <= 0;
            LD <= 0;
        end
        else if( count < 100000000 ) begin
            count <= count + 1;
        end 
        else if( count == 100000000) begin
            count <= 0;
            LD <= LD + 1;
        end
    end    
     
endmodule
