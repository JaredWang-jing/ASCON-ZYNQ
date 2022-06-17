`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 20:10:04
// Design Name: 
// Module Name: finalization
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


module finalization(final_sin,clk,rst,key,tag);
input [319:0] final_sin;
input clk,rst;
input [127:0] key;
output [127:0] tag;



wire [319:0] p12_sin,p12_sout;

assign p12_sin={final_sin[319:256],final_sin[255:128]^key,final_sin[127:0]};

p12 p1(.clk(clk),.rst(rst),.s_in(p12_sin),.s_out(p12_sout));

assign tag=p12_sout[127:0]^key;




endmodule
