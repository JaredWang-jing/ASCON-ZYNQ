`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 21:31:00
// Design Name: 
// Module Name: sbox
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


module sbox(sbox_in,sbox_out);
input [4:0] sbox_in;
output wire [4:0] sbox_out;


wire [4:0]sbox[31:0];    
assign sbox_out=sbox[sbox_in];


    
assign sbox[5'h0]=5'h4;
assign sbox[5'h1]=5'hb;
assign sbox[5'h2]=5'h1f;
assign sbox[5'h3]=5'h14;
assign sbox[5'h4]=5'h1a;
assign sbox[5'h5]=5'h15;
assign sbox[5'h6]=5'h9;
assign sbox[5'h7]=5'h2;
assign sbox[5'h8]=5'h1b;
assign sbox[5'h9]=5'h5;
assign sbox[5'ha]=5'h8;
assign sbox[5'hb]=5'h12;
assign sbox[5'hc]=5'h1d;
assign sbox[5'hd]=5'h3;
assign sbox[5'he]=5'h6;
assign sbox[5'hf]=5'h1c;
assign sbox[5'h10]=5'h1e;
assign sbox[5'h11]=5'h13;
assign sbox[5'h12]=5'h7;
assign sbox[5'h13]=5'he;
assign sbox[5'h14]=5'h0;
assign sbox[5'h15]=5'hd;
assign sbox[5'h16]=5'h11;
assign sbox[5'h17]=5'h18;
assign sbox[5'h18]=5'h10;
assign sbox[5'h19]=5'hc;
assign sbox[5'h1a]=5'h1;
assign sbox[5'h1b]=5'h19;
assign sbox[5'h1c]=5'h16;
assign sbox[5'h1d]=5'ha;
assign sbox[5'h1e]=5'hf;
assign sbox[5'h1f]=5'h17;    
    
    
    
    
endmodule