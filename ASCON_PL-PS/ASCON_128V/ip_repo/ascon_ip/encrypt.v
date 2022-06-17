`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 20:09:02
// Design Name: 
// Module Name: encrypt
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


module encrypt(clk,rst,ini_sin,key,enc_ad,enc_adlen,m_adlen,m_ad,ct_out);
input clk,rst;
input [319:0] ini_sin;
input [127:0] key;
input [31:0] enc_ad,enc_adlen,m_ad,m_adlen;
output [383:0] ct_out;


wire [319:0] sout2_pt;
wire [383:0] cipher_out;
wire [319:0] enc_sout2_final;
wire [127:0] enc_tag;




AD u2(.clk(clk),.rst(rst),.ad_sin(ini_sin),.ad_ad(enc_ad),.ad_adlen(enc_adlen),.ad_sout(sout2_pt));

PT u3(.clk(clk),.rst(rst),.pt_sin(sout2_pt),.pt_in(m_ad),.pt_adlen(m_adlen),.cipher_out(cipher_out),.pt_sout2_final(enc_sout2_final));

finalization u4(.clk(clk),.rst(rst),.final_sin(enc_sout2_final),.key(key),.tag(enc_tag));

assign ct_out={cipher_out[383:128],cipher_out[127:0]^enc_tag};


endmodule
