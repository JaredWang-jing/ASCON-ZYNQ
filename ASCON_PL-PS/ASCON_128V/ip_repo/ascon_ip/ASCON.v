`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 20:05:29
// Design Name: 
// Module Name: ASCON
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


//module ASCON(clk,rst,ini_sin_ps,key,ad_ad,ad_adlen,ct_ad,ct_adlen,m_ad,m_adlen,ct_out,pt_out);
module ASCON(clk,rst,ps_in,ct_out,pt_out);
input clk,rst;
input [191:0] ps_in;
output [383:0] ct_out;
output [255:0] pt_out;
//�ӿ�˵��,
//���۶��ڼ���ģ�黹�ǽ���ģ����ڹ̶���ASCONģʽ��˵������ĳ�ʼ״̬ini_sin���ǹ̶��ģ����Թ̻���FPGA�ڲ�

//���۶��ڼ���ģ�黹�ǽ���ģ����ڹ̶���ASCONģʽ��˵���������Կkey���ǹ̶��ģ�
//�ҳ�ʼ״̬ini_sin��������Կ��Ϣ�����Կ��ǽ���ϲ���ini_sin����

//�������ݳ��ȶ���һ��ȷ���ļ�����˵�����Ǳ����ܺͽ��ܹ��õģ����ĳ��ȡ���ַ�����ĳ��ȡ���ַ�����ⲿ����

//���������������һ���Ǽ��ܽ���ct_out������256λ����λ��128λ��ǩλ��
//��û���������ڼ��ܵ�����½��ܽ��pt���ȫf






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


//�Գ�ʼ��������й̻�
assign ini_sin_ps=320'hbc830fbef3a1651b_487a66865036b909_a031b0c5810c1cd6_dd7ce72083702217_9b17156ede557ce7;


//����Կ���й̻�
assign key=128'h0001020304050607_08090a0b0c0d0e0f;




encrypt u1(.clk(clk),.rst(rst),.ini_sin(ini_sin_ps),.key(key),.enc_ad(ad_ad),.enc_adlen(ad_adlen),.m_adlen(m_adlen),.m_ad(m_ad),.ct_out(ct_out));
decrypt u2(.clk(clk),.rst(rst),.ini_sin(ini_sin_ps),.key(key),.dec_ad(ad_ad),.dec_adlen(ad_adlen),.ct_in(ct_out),.ct_ad(ct_ad),.ct_adlen(ct_adlen),.pt_out(pt_out));







endmodule
