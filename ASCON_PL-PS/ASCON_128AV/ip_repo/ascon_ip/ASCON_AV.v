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
//ascon_avģʽ�µ�ini_sin
assign ini_sin_ps=320'h6e480efdd1b65260_6f3c06d33047c1b2_63a829beb8aad370_a282e964b4b757ec_03bf3b375a49ae6d;





//����Կ���й̻�
assign key=128'h0001020304050607_08090a0b0c0d0e0f;




encrypt u1(.clk(clk),.rst(rst),.ini_sin(ini_sin_ps),.key(key),.enc_ad(ad_ad),.enc_adlen(ad_adlen),.m_adlen(m_adlen),.m_ad(m_ad),.ct_out(ct_out));
decrypt u2(.clk(clk),.rst(rst),.ini_sin(ini_sin_ps),.key(key),.dec_ad(ad_ad),.dec_adlen(ad_adlen),.ct_in(ct_out),.ct_ad(ct_ad),.ct_adlen(ct_adlen),.pt_out(pt_out));



endmodule
