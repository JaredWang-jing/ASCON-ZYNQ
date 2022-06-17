`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 20:10:25
// Design Name: 
// Module Name: decrypt
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


module decrypt(clk,rst,ini_sin,key,dec_ad,dec_adlen,ct_in,ct_ad,ct_adlen,pt_out);
input clk,rst;
input [319:0] ini_sin;
input [127:0] key;
input [5:0] dec_ad,dec_adlen,ct_ad,ct_adlen;
input [383:0] ct_in;
output [255:0] pt_out;

wire [319:0] dec_ini_sout;
wire [319:0] sout2_ct;
wire [319:0] dec_sout2_final;
wire [127:0] dec_tag;




AD u2(.clk(clk),.rst(rst),.ad_sin(ini_sin),.ad_ad(dec_ad),.ad_adlen(dec_adlen),.ad_sout(sout2_ct));

CT u3(.clk(clk),.rst(rst),.ct_ad(ct_ad),.ct_adlen(ct_adlen),.ct(ct_in),.ct_sin(sout2_ct),.pt_out(pt_out),.sout2_final(dec_sout2_final));

finalization u4(.clk(clk),.rst(rst),.final_sin(dec_sout2_final),.key(key),.tag(dec_tag));


//≤‚ ‘–≈∫≈
wire test;
assign test=1'b1;


endmodule
