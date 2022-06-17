`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 21:20:58
// Design Name: 
// Module Name: ASCON_AV
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


module ASCON_AV(clk,rst,ps_in,ct_out,pt_out);
input clk,rst;
input [191:0] ps_in;
output [383:0] ct_out;
output [255:0] pt_out;
//接口说明,
//无论对于加密模块还是解密模块对于固定的ASCON模式来说，输入的初始状态ini_sin都是固定的，可以固化到FPGA内部

//无论对于加密模块还是解密模块对于固定的ASCON模式来说，输入的密钥key都是固定的，
//且初始状态ini_sin包含了密钥信息，可以考虑将其合并到ini_sin里面

//关联数据长度对于一次确定的加密来说，他是被加密和解密公用的，明文长度、地址，密文长度、地址都是外部输入

//输出参数有两个，一个是加密解密ct_out，包含256位密文位和128位标签位，
//在没有明文用于加密的情况下解密结果pt输出全f






wire  [319:0] ini_sin_ps;
wire  [31:0] ascon_mode;
wire  [127:0] key;
wire  [31:0] ad_ad,ad_adlen,ct_ad,ct_adlen,m_ad,m_adlen;



assign ad_ad=ps_in[191:160];
assign ad_adlen=ps_in[159:128];
assign m_ad=ps_in[127:96];
assign m_adlen=ps_in[95:64];
assign ct_ad=ps_in[63:32];
assign ct_adlen=ps_in[31:0];


//对初始化结果进行固化
//ascon_av模式下的ini_sin
assign ini_sin_ps=320'h6e480efdd1b65260_6f3c06d33047c1b2_63a829beb8aad370_a282e964b4b757ec_03bf3b375a49ae6d;





//对密钥进行固化
assign key=128'h0001020304050607_08090a0b0c0d0e0f;




encrypt u1(.clk(clk),.rst(rst),.ini_sin(ini_sin_ps),.key(key),.enc_ad(ad_ad),.enc_adlen(ad_adlen),.m_adlen(m_adlen),.m_ad(m_ad),.ct_out(ct_out));
decrypt u2(.clk(clk),.rst(rst),.ini_sin(ini_sin_ps),.key(key),.dec_ad(ad_ad),.dec_adlen(ad_adlen),.ct_in(ct_out),.ct_ad(ct_ad),.ct_adlen(ct_adlen),.pt_out(pt_out));



endmodule
