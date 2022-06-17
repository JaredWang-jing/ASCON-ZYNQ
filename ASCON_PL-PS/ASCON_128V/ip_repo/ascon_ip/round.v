`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 20:13:18
// Design Name: 
// Module Name: round
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


module round(s,s_rout,C,clk,rst);
    input [319:0] s;
    input  [7:0] C;
    input clk,rst;
    output [319:0] s_rout;
    





//采用时组合电路实现轮常量加
wire [63:0] temp1_x2;
assign temp1_x2={s[191:136],s[135:128]^C};








//采用查找表的方式实现S盒
wire [4:0]  s_in0,s_in1,s_in2,s_in3,s_in4,s_in5,s_in6,s_in7,s_in8,s_in9,s_in10,s_in11,s_in12,s_in13,s_in14,s_in15,s_in16,
s_in17,s_in18,s_in19,s_in20,s_in21,s_in22,s_in23,s_in24,s_in25,s_in26,s_in27,s_in28,s_in29,s_in30,s_in31,s_in32,s_in33,
s_in34,s_in35,s_in36,s_in37,s_in38,s_in39,s_in40,s_in41,s_in42,s_in43,s_in44,s_in45,s_in46,s_in47,s_in48,s_in49,s_in50,
s_in51,s_in52,s_in53,s_in54,s_in55,s_in56,s_in57,s_in58,s_in59,s_in60,s_in61,s_in62,s_in63;

wire [4:0] s_out0,s_out1,s_out2,s_out3,s_out4,s_out5,s_out6,s_out7,s_out8,s_out9,s_out10,s_out11,s_out12,s_out13,s_out14,
s_out15,s_out16,s_out17,s_out18,s_out19,s_out20,s_out21,s_out22,s_out23,s_out24,s_out25,s_out26,s_out27,s_out28,s_out29,
s_out30,s_out31,s_out32,s_out33,s_out34,s_out35,s_out36,s_out37,s_out38,s_out39,s_out40,s_out41,s_out42,s_out43,s_out44,
s_out45,s_out46,s_out47,s_out48,s_out49,s_out50,s_out51,s_out52,s_out53,s_out54,s_out55,s_out56,s_out57,s_out58,s_out59,
s_out60,s_out61,s_out62,s_out63;


assign s_in0= {s[256],s[192],temp1_x2[0] ,s[64] ,s[0] };//最低5位
assign s_in1= {s[257],s[193],temp1_x2[1] ,s[65] ,s[1] };
assign s_in2= {s[258],s[194],temp1_x2[2] ,s[66] ,s[2] };
assign s_in3= {s[259],s[195],temp1_x2[3] ,s[67] ,s[3] };
assign s_in4= {s[260],s[196],temp1_x2[4] ,s[68] ,s[4] };
assign s_in5= {s[261],s[197],temp1_x2[5] ,s[69] ,s[5] };
assign s_in6= {s[262],s[198],temp1_x2[6] ,s[70] ,s[6] };
assign s_in7= {s[263],s[199],temp1_x2[7] ,s[71] ,s[7] };
assign s_in8= {s[264],s[200],temp1_x2[8] ,s[72] ,s[8] };
assign s_in9= {s[265],s[201],temp1_x2[9] ,s[73] ,s[9] };
assign s_in10={s[266],s[202],temp1_x2[10],s[74] ,s[10]};
assign s_in11={s[267],s[203],temp1_x2[11],s[75] ,s[11]};
assign s_in12={s[268],s[204],temp1_x2[12],s[76] ,s[12]};
assign s_in13={s[269],s[205],temp1_x2[13],s[77] ,s[13]};
assign s_in14={s[270],s[206],temp1_x2[14],s[78] ,s[14]};
assign s_in15={s[271],s[207],temp1_x2[15],s[79] ,s[15]};
assign s_in16={s[272],s[208],temp1_x2[16],s[80] ,s[16]};
assign s_in17={s[273],s[209],temp1_x2[17],s[81] ,s[17]};
assign s_in18={s[274],s[210],temp1_x2[18],s[82] ,s[18]};
assign s_in19={s[275],s[211],temp1_x2[19],s[83] ,s[19]};
assign s_in20={s[276],s[212],temp1_x2[20],s[84] ,s[20]};
assign s_in21={s[277],s[213],temp1_x2[21],s[85] ,s[21]};
assign s_in22={s[278],s[214],temp1_x2[22],s[86] ,s[22]};
assign s_in23={s[279],s[215],temp1_x2[23],s[87] ,s[23]};
assign s_in24={s[280],s[216],temp1_x2[24],s[88] ,s[24]};
assign s_in25={s[281],s[217],temp1_x2[25],s[89] ,s[25]};
assign s_in26={s[282],s[218],temp1_x2[26],s[90] ,s[26]};
assign s_in27={s[283],s[219],temp1_x2[27],s[91] ,s[27]};
assign s_in28={s[284],s[220],temp1_x2[28],s[92] ,s[28]};
assign s_in29={s[285],s[221],temp1_x2[29],s[93] ,s[29]};
assign s_in30={s[286],s[222],temp1_x2[30],s[94] ,s[30]};
assign s_in31={s[287],s[223],temp1_x2[31],s[95] ,s[31]};
assign s_in32={s[288],s[224],temp1_x2[32],s[96] ,s[32]};
assign s_in33={s[289],s[225],temp1_x2[33],s[97] ,s[33]};
assign s_in34={s[290],s[226],temp1_x2[34],s[98] ,s[34]};
assign s_in35={s[291],s[227],temp1_x2[35],s[99] ,s[35]};
assign s_in36={s[292],s[228],temp1_x2[36],s[100],s[36]};
assign s_in37={s[293],s[229],temp1_x2[37],s[101],s[37]};
assign s_in38={s[294],s[230],temp1_x2[38],s[102],s[38]};
assign s_in39={s[295],s[231],temp1_x2[39],s[103],s[39]};
assign s_in40={s[296],s[232],temp1_x2[40],s[104],s[40]};
assign s_in41={s[297],s[233],temp1_x2[41],s[105],s[41]};
assign s_in42={s[298],s[234],temp1_x2[42],s[106],s[42]};
assign s_in43={s[299],s[235],temp1_x2[43],s[107],s[43]};
assign s_in44={s[300],s[236],temp1_x2[44],s[108],s[44]};
assign s_in45={s[301],s[237],temp1_x2[45],s[109],s[45]};
assign s_in46={s[302],s[238],temp1_x2[46],s[110],s[46]};
assign s_in47={s[303],s[239],temp1_x2[47],s[111],s[47]};
assign s_in48={s[304],s[240],temp1_x2[48],s[112],s[48]};
assign s_in49={s[305],s[241],temp1_x2[49],s[113],s[49]};
assign s_in50={s[306],s[242],temp1_x2[50],s[114],s[50]};
assign s_in51={s[307],s[243],temp1_x2[51],s[115],s[51]};
assign s_in52={s[308],s[244],temp1_x2[52],s[116],s[52]};
assign s_in53={s[309],s[245],temp1_x2[53],s[117],s[53]};
assign s_in54={s[310],s[246],temp1_x2[54],s[118],s[54]};
assign s_in55={s[311],s[247],temp1_x2[55],s[119],s[55]};
assign s_in56={s[312],s[248],temp1_x2[56],s[120],s[56]};
assign s_in57={s[313],s[249],temp1_x2[57],s[121],s[57]};
assign s_in58={s[314],s[250],temp1_x2[58],s[122],s[58]};
assign s_in59={s[315],s[251],temp1_x2[59],s[123],s[59]};
assign s_in60={s[316],s[252],temp1_x2[60],s[124],s[60]};
assign s_in61={s[317],s[253],temp1_x2[61],s[125],s[61]};
assign s_in62={s[318],s[254],temp1_x2[62],s[126],s[62]};
assign s_in63={s[319],s[255],temp1_x2[63],s[127],s[63]};//最高5位




//sbox组合形式调用
sbox p0(.sbox_in(s_in0),.sbox_out(s_out0));
sbox p1(.sbox_in(s_in1),.sbox_out(s_out1));
sbox p2(.sbox_in(s_in2),.sbox_out(s_out2));
sbox p3(.sbox_in(s_in3),.sbox_out(s_out3));
sbox p4(.sbox_in(s_in4),.sbox_out(s_out4));
sbox p5(.sbox_in(s_in5),.sbox_out(s_out5));
sbox p6(.sbox_in(s_in6),.sbox_out(s_out6));
sbox p7(.sbox_in(s_in7),.sbox_out(s_out7));
sbox p8(.sbox_in(s_in8),.sbox_out(s_out8));
sbox p9(.sbox_in(s_in9),.sbox_out(s_out9));
sbox p10(.sbox_in(s_in10),.sbox_out(s_out10));
sbox p11(.sbox_in(s_in11),.sbox_out(s_out11));
sbox p12(.sbox_in(s_in12),.sbox_out(s_out12));
sbox p13(.sbox_in(s_in13),.sbox_out(s_out13));
sbox p14(.sbox_in(s_in14),.sbox_out(s_out14));
sbox p15(.sbox_in(s_in15),.sbox_out(s_out15));
sbox p16(.sbox_in(s_in16),.sbox_out(s_out16));
sbox p17(.sbox_in(s_in17),.sbox_out(s_out17));
sbox p18(.sbox_in(s_in18),.sbox_out(s_out18));
sbox p19(.sbox_in(s_in19),.sbox_out(s_out19));
sbox p20(.sbox_in(s_in20),.sbox_out(s_out20));
sbox p21(.sbox_in(s_in21),.sbox_out(s_out21));
sbox p22(.sbox_in(s_in22),.sbox_out(s_out22));
sbox p23(.sbox_in(s_in23),.sbox_out(s_out23));
sbox p24(.sbox_in(s_in24),.sbox_out(s_out24));
sbox p25(.sbox_in(s_in25),.sbox_out(s_out25));
sbox p26(.sbox_in(s_in26),.sbox_out(s_out26));
sbox p27(.sbox_in(s_in27),.sbox_out(s_out27));
sbox p28(.sbox_in(s_in28),.sbox_out(s_out28));
sbox p29(.sbox_in(s_in29),.sbox_out(s_out29));
sbox p30(.sbox_in(s_in30),.sbox_out(s_out30));
sbox p31(.sbox_in(s_in31),.sbox_out(s_out31));
sbox p32(.sbox_in(s_in32),.sbox_out(s_out32));
sbox p33(.sbox_in(s_in33),.sbox_out(s_out33));
sbox p34(.sbox_in(s_in34),.sbox_out(s_out34));
sbox p35(.sbox_in(s_in35),.sbox_out(s_out35));
sbox p36(.sbox_in(s_in36),.sbox_out(s_out36));
sbox p37(.sbox_in(s_in37),.sbox_out(s_out37));
sbox p38(.sbox_in(s_in38),.sbox_out(s_out38));
sbox p39(.sbox_in(s_in39),.sbox_out(s_out39));
sbox p40(.sbox_in(s_in40),.sbox_out(s_out40));
sbox p41(.sbox_in(s_in41),.sbox_out(s_out41));
sbox p42(.sbox_in(s_in42),.sbox_out(s_out42));
sbox p43(.sbox_in(s_in43),.sbox_out(s_out43));
sbox p44(.sbox_in(s_in44),.sbox_out(s_out44));
sbox p45(.sbox_in(s_in45),.sbox_out(s_out45));
sbox p46(.sbox_in(s_in46),.sbox_out(s_out46));
sbox p47(.sbox_in(s_in47),.sbox_out(s_out47));
sbox p48(.sbox_in(s_in48),.sbox_out(s_out48));
sbox p49(.sbox_in(s_in49),.sbox_out(s_out49));
sbox p50(.sbox_in(s_in50),.sbox_out(s_out50));
sbox p51(.sbox_in(s_in51),.sbox_out(s_out51));
sbox p52(.sbox_in(s_in52),.sbox_out(s_out52));
sbox p53(.sbox_in(s_in53),.sbox_out(s_out53));
sbox p54(.sbox_in(s_in54),.sbox_out(s_out54));
sbox p55(.sbox_in(s_in55),.sbox_out(s_out55));
sbox p56(.sbox_in(s_in56),.sbox_out(s_out56));
sbox p57(.sbox_in(s_in57),.sbox_out(s_out57));
sbox p58(.sbox_in(s_in58),.sbox_out(s_out58));
sbox p59(.sbox_in(s_in59),.sbox_out(s_out59));
sbox p60(.sbox_in(s_in60),.sbox_out(s_out60));
sbox p61(.sbox_in(s_in61),.sbox_out(s_out61));
sbox p62(.sbox_in(s_in62),.sbox_out(s_out62));
sbox p63(.sbox_in(s_in63),.sbox_out(s_out63));


 
 
wire [63:0] temp_x0,temp_x1,temp_x2,temp_x3,temp_x4;   
assign         temp_x4={s_out63[0],s_out62[0],s_out61[0],s_out60[0],s_out59[0],s_out58[0],s_out57[0],s_out56[0],s_out55[0],
s_out54[0],s_out53[0],s_out52[0],s_out51[0],s_out50[0],s_out49[0],s_out48[0],s_out47[0],s_out46[0],s_out45[0],
s_out44[0],s_out43[0],s_out42[0],s_out41[0],s_out40[0],s_out39[0],s_out38[0],s_out37[0],s_out36[0],s_out35[0],
s_out34[0],s_out33[0],s_out32[0],s_out31[0],s_out30[0],s_out29[0],s_out28[0],s_out27[0],s_out26[0],s_out25[0],
s_out24[0],s_out23[0],s_out22[0],s_out21[0],s_out20[0],s_out19[0],s_out18[0],s_out17[0],s_out16[0],s_out15[0],
s_out14[0],s_out13[0],s_out12[0],s_out11[0],s_out10[0],s_out9[0],s_out8[0],s_out7[0],s_out6[0],s_out5[0],
s_out4[0],s_out3[0],s_out2[0],s_out1[0],s_out0[0]};
assign        temp_x3={s_out63[1],s_out62[1],s_out61[1],s_out60[1],s_out59[1],s_out58[1],s_out57[1],s_out56[1],s_out55[1],
 s_out54[1],s_out53[1],s_out52[1],s_out51[1],s_out50[1],s_out49[1],s_out48[1],s_out47[1],s_out46[1],s_out45[1],
 s_out44[1],s_out43[1],s_out42[1],s_out41[1],s_out40[1],s_out39[1],s_out38[1],s_out37[1],s_out36[1],s_out35[1],
 s_out34[1],s_out33[1],s_out32[1],s_out31[1],s_out30[1],s_out29[1],s_out28[1],s_out27[1],s_out26[1],s_out25[1],
 s_out24[1],s_out23[1],s_out22[1],s_out21[1],s_out20[1],s_out19[1],s_out18[1],s_out17[1],s_out16[1],s_out15[1],
 s_out14[1],s_out13[1],s_out12[1],s_out11[1],s_out10[1],s_out9[1],s_out8[1],s_out7[1],s_out6[1],s_out5[1],
 s_out4[1],s_out3[1],s_out2[1],s_out1[1],s_out0[1]};
assign        temp_x2={s_out63[2],s_out62[2],s_out61[2],s_out60[2],s_out59[2],s_out58[2],s_out57[2],s_out56[2],s_out55[2],
s_out54[2],s_out53[2],s_out52[2],s_out51[2],s_out50[2],s_out49[2],s_out48[2],s_out47[2],s_out46[2],s_out45[2],
s_out44[2],s_out43[2],s_out42[2],s_out41[2],s_out40[2],s_out39[2],s_out38[2],s_out37[2],s_out36[2],s_out35[2],
s_out34[2],s_out33[2],s_out32[2],s_out31[2],s_out30[2],s_out29[2],s_out28[2],s_out27[2],s_out26[2],s_out25[2],
s_out24[2],s_out23[2],s_out22[2],s_out21[2],s_out20[2],s_out19[2],s_out18[2],s_out17[2],s_out16[2],s_out15[2],
s_out14[2],s_out13[2],s_out12[2],s_out11[2],s_out10[2],s_out9[2],s_out8[2],s_out7[2],s_out6[2],s_out5[2],s_out4[2],
s_out3[2],s_out2[2],s_out1[2],s_out0[2]}; 
assign        temp_x1={s_out63[3],s_out62[3],s_out61[3],s_out60[3],s_out59[3],s_out58[3],s_out57[3],s_out56[3],s_out55[3],
s_out54[3],s_out53[3],s_out52[3],s_out51[3],s_out50[3],s_out49[3],s_out48[3],s_out47[3],s_out46[3],s_out45[3],s_out44[3],
s_out43[3],s_out42[3],s_out41[3],s_out40[3],s_out39[3],s_out38[3],s_out37[3],s_out36[3],s_out35[3],s_out34[3],s_out33[3],
s_out32[3],s_out31[3],s_out30[3],s_out29[3],s_out28[3],s_out27[3],s_out26[3],s_out25[3],s_out24[3],s_out23[3],s_out22[3],
s_out21[3],s_out20[3],s_out19[3],s_out18[3],s_out17[3],s_out16[3],s_out15[3],s_out14[3],s_out13[3],s_out12[3],s_out11[3],
s_out10[3],s_out9[3],s_out8[3],s_out7[3],s_out6[3],s_out5[3],s_out4[3],s_out3[3],s_out2[3],s_out1[3],s_out0[3]};
assign        temp_x0={s_out63[4],s_out62[4],s_out61[4],s_out60[4],s_out59[4],s_out58[4],s_out57[4],s_out56[4],s_out55[4],s_out54[4],
s_out53[4],s_out52[4],s_out51[4],s_out50[4],s_out49[4],s_out48[4],s_out47[4],s_out46[4],s_out45[4],s_out44[4],s_out43[4],
s_out42[4],s_out41[4],s_out40[4],s_out39[4],s_out38[4],s_out37[4],s_out36[4],s_out35[4],s_out34[4],s_out33[4],s_out32[4],
s_out31[4],s_out30[4],s_out29[4],s_out28[4],s_out27[4],s_out26[4],s_out25[4],s_out24[4],s_out23[4],s_out22[4],s_out21[4],
s_out20[4],s_out19[4],s_out18[4],s_out17[4],s_out16[4],s_out15[4],s_out14[4],s_out13[4],s_out12[4],s_out11[4],s_out10[4],
s_out9[4],s_out8[4],s_out7[4],s_out6[4],s_out5[4],s_out4[4],s_out3[4],s_out2[4],s_out1[4],s_out0[4]};        
//    end

//end






assign s_rout={temp_x0^{temp_x0[18:0],temp_x0[63:19]}^{temp_x0[27:0],temp_x0[63:28]},
temp_x1^{temp_x1[60:0],temp_x1[63:61]}^{temp_x1[38:0],temp_x1[63:39]},
temp_x2^{temp_x2[0],temp_x2[63:1]}^{temp_x2[5:0],temp_x2[63:6]},
temp_x3^{temp_x3[9:0],temp_x3[63:10]}^{temp_x3[16:0],temp_x3[63:17]},
temp_x4^{temp_x4[6:0],temp_x4[63:7]}^{temp_x4[40:0],temp_x4[63:41]}};




endmodule
