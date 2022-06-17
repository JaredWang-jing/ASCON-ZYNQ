`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 20:12:49
// Design Name: 
// Module Name: p6
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


module p6(s_in,s_out,rst,clk);
input [319:0] s_in;
input rst,clk;
output [319:0] s_out;


reg [7:0] c1=8'h96;
reg [7:0] c2=8'h87;
reg [7:0] c3=8'h78;
reg [7:0] c4=8'h69;
reg [7:0] c5=8'h5a;
reg [7:0] c6=8'h4b;

wire [319:0] s_rout1;
wire [319:0] s_rout2;
wire [319:0] s_rout3;
wire [319:0] s_rout4;
wire [319:0] s_rout5;



round u1 (.clk(clk),.rst(rst),.C(c1),.s(s_in),.s_rout(s_rout1));
round u2 (.clk(clk),.rst(rst),.C(c2),.s(s_rout1),.s_rout(s_rout2));
round u3 (.clk(clk),.rst(rst),.C(c3),.s(s_rout2),.s_rout(s_rout3));
round u4 (.clk(clk),.rst(rst),.C(c4),.s(s_rout3),.s_rout(s_rout4));
round u5 (.clk(clk),.rst(rst),.C(c5),.s(s_rout4),.s_rout(s_rout5));
round u6 (.clk(clk),.rst(rst),.C(c6),.s(s_rout5),.s_rout(s_out));

endmodule
