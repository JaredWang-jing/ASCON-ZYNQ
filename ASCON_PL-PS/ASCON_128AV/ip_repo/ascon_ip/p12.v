`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 21:52:16
// Design Name: 
// Module Name: p12
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


module p12(s_in,s_out,clk,rst);
input [319:0] s_in;
input clk,rst;
output [319:0] s_out;


reg [7:0] c1=8'hf0;
reg [7:0] c2=8'he1;
reg [7:0] c3=8'hd2;
reg [7:0] c4=8'hc3;
reg [7:0] c5=8'hb4;
reg [7:0] c6=8'ha5;
reg [7:0] c7=8'h96;
reg [7:0] c8=8'h87;
reg [7:0] c9=8'h78;
reg [7:0] c10=8'h69;
reg [7:0] c11=8'h5a;
reg [7:0] c12=8'h4b;



wire [319:0] s_rout1;
wire [319:0] s_rout2;
wire [319:0] s_rout3;
wire [319:0] s_rout4;
wire [319:0] s_rout5;
wire [319:0] s_rout6;
wire [319:0] s_rout7;
wire [319:0] s_rout8;
wire [319:0] s_rout9;
wire [319:0] s_rout10;
wire [319:0] s_rout11;



round u1 (.clk(clk),.rst(rst),.C(c1),.s(s_in),.s_rout(s_rout1));
round u2 (.clk(clk),.rst(rst),.C(c2),.s(s_rout1),.s_rout(s_rout2));
round u3 (.clk(clk),.rst(rst),.C(c3),.s(s_rout2),.s_rout(s_rout3));
round u4 (.clk(clk),.rst(rst),.C(c4),.s(s_rout3),.s_rout(s_rout4));
round u5 (.clk(clk),.rst(rst),.C(c5),.s(s_rout4),.s_rout(s_rout5));
round u6 (.clk(clk),.rst(rst),.C(c6),.s(s_rout5),.s_rout(s_rout6));
round u7 (.clk(clk),.rst(rst),.C(c7),.s(s_rout6),.s_rout(s_rout7));
round u8 (.clk(clk),.rst(rst),.C(c8),.s(s_rout7),.s_rout(s_rout8));
round u9 (.clk(clk),.rst(rst),.C(c9),.s(s_rout8),.s_rout(s_rout9));
round u10 (.clk(clk),.rst(rst),.C(c10),.s(s_rout9),.s_rout(s_rout10));
round u11 (.clk(clk),.rst(rst),.C(c11),.s(s_rout10),.s_rout(s_rout11));
round u12 (.clk(clk),.rst(rst),.C(c12),.s(s_rout11),.s_rout(s_out));


//round u1 (.clk(clk),.rst(rst),.C(c1),.s(s_in),.s_rout(s_out));


endmodule
