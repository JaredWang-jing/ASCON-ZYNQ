`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 21:24:30
// Design Name: 
// Module Name: AD
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


module AD(ad_ad,ad_adlen,clk,rst,ad_sin,ad_sout);
input [31:0] ad_ad;
input [319:0] ad_sin;
input [31:0] ad_adlen;
input clk,rst;
output  reg [319:0] ad_sout;






reg [31:0] next_ad,next_adlen;
reg [255:0] AD=256'h0001020304050607_08090A0B0C0D0E0F_1011121314151617_18191A1B1C1D1E1F;
wire [319:0] p8_sout_phase1,p8_sout_phase2;
reg [319:0] sout2_p8;



assign p8_sout_phase1=320'h40e86dc599ee094b_0780045485f506b1_be22a3c5cbbbe011_13898239be608a1b_9f8f7e20b5622fb3;

assign p8_sout_phase2=320'h7dbb1469affc98c5_c38e4863d292bb6b_1500254b1466ca74_4ecf16f87ea3ee32_8a2d300976f17187;









//always@(posedge clk,negedge rst) begin
always@(posedge clk) begin
        next_adlen<=ad_adlen+1;
 end 






always@(posedge clk,negedge rst)
begin if(!rst)  begin sout2_p8<=sout2_p8;  end 
else begin
        if(ad_adlen==1) sout2_p8<={{AD[255:248],56'h80_0000_0000_0000}^ad_sin[319:256],ad_sin[255:0]};
        if(ad_adlen==2) sout2_p8<={{AD[255:240],48'h8000_0000_0000   }^ad_sin[319:256],ad_sin[255:0]};
        if(ad_adlen==3) sout2_p8<={{AD[255:232],40'h80_0000_0000     }^ad_sin[319:256],ad_sin[255:0]};   
        if(ad_adlen==4) sout2_p8<={{AD[255:224],32'h8000_0000        }^ad_sin[319:256],ad_sin[255:0]};
        if(ad_adlen==5) sout2_p8<={{AD[255:216],24'h80_0000          }^ad_sin[319:256],ad_sin[255:0]};
        if(ad_adlen==6) sout2_p8<={{AD[255:208],16'h8000             }^ad_sin[319:256],ad_sin[255:0]};
        if(ad_adlen==7) sout2_p8<={{AD[255:200],8'h80                }^ad_sin[319:256],ad_sin[255:0]};
        if(ad_adlen==8) sout2_p8<={AD[255:192]^ad_sin[319:256],ad_sin[255:192]^64'h8000_0000_0000_0000,ad_sin[191:0]};        
        
        if(ad_adlen==9)  begin sout2_p8={AD[255:192]^ad_sin[319:256],{AD[191:184],56'h80_0000_0000_0000}^ad_sin[255:192],ad_sin[191:0]}; end
        if(ad_adlen==10) begin sout2_p8={AD[255:192]^ad_sin[319:256],{AD[191:176],48'h8000_0000_0000   }^ad_sin[255:192],ad_sin[191:0]}; end
        if(ad_adlen==11) begin sout2_p8={AD[255:192]^ad_sin[319:256],{AD[191:168],40'h80_0000_0000     }^ad_sin[255:192],ad_sin[191:0]}; end
        if(ad_adlen==12) begin sout2_p8={AD[255:192]^ad_sin[319:256],{AD[191:160],32'h8000_0000        }^ad_sin[255:192],ad_sin[191:0]}; end
        if(ad_adlen==13) begin sout2_p8={AD[255:192]^ad_sin[319:256],{AD[191:152],24'h80_0000          }^ad_sin[255:192],ad_sin[191:0]}; end
        if(ad_adlen==14) begin sout2_p8={AD[255:192]^ad_sin[319:256],{AD[191:144],16'h8000             }^ad_sin[255:192],ad_sin[191:0]}; end
        if(ad_adlen==15) begin sout2_p8={AD[255:192]^ad_sin[319:256],{AD[191:136], 8'h80               }^ad_sin[255:192],ad_sin[191:0]}; end
        
//        if(ad_adlen==16) begin sout2_p8={AD[255:192]^ad_sin[319:256],{AD[191:128]}^ad_sin[255:192]}; end
        if(ad_adlen==16)begin sout2_p8={p8_sout_phase1[319:256]^64'h8000_0000_0000_0000,p8_sout_phase1[255:0]}; end

        if(ad_adlen==17)begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:120],56'h80_0000_0000_0000},p8_sout_phase1[255:0]};   end
        if(ad_adlen==18)begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:112],48'h8000_0000_0000   },p8_sout_phase1[255:0]};   end
        if(ad_adlen==19)begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:104],40'h80_0000_0000     },p8_sout_phase1[255:0]};   end
        if(ad_adlen==20)begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:96] ,32'h8000_0000        },p8_sout_phase1[255:0]};   end
        if(ad_adlen==21)begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:88] ,24'h80_0000          },p8_sout_phase1[255:0]};   end
        if(ad_adlen==22)begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:80] ,16'h8000             },p8_sout_phase1[255:0]};   end
        if(ad_adlen==23)begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:72] ,8'h80                },p8_sout_phase1[255:0]};   end
        
        
        if(ad_adlen==24) begin sout2_p8<={p8_sout_phase1[319:256]^AD[127:64],p8_sout_phase1[255:192]^64'h8000_0000_0000_0000,p8_sout_phase1[191:0]}    ;  end 
          
        if(ad_adlen==25) begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:64]},p8_sout_phase1[255:192]^{AD[63:56],56'h080_0000_0000_0000},p8_sout_phase1[191:128],p8_sout_phase1[127:0]};  end
        if(ad_adlen==26) begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:64]},p8_sout_phase1[255:192]^{AD[63:48],48'h8000_0000_0000    },p8_sout_phase1[191:128],p8_sout_phase1[127:0]};  end
        if(ad_adlen==27) begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:64]},p8_sout_phase1[255:192]^{AD[63:40],40'h80_0000_0000      },p8_sout_phase1[191:128],p8_sout_phase1[127:0]};  end
        if(ad_adlen==28) begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:64]},p8_sout_phase1[255:192]^{AD[63:32],32'h8000_0000         },p8_sout_phase1[191:128],p8_sout_phase1[127:0]};  end
        if(ad_adlen==29) begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:64]},p8_sout_phase1[255:192]^{AD[63:24],24'h80_0000           },p8_sout_phase1[191:128],p8_sout_phase1[127:0]};  end
        if(ad_adlen==30) begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:64]},p8_sout_phase1[255:192]^{AD[63:16],16'h8000              },p8_sout_phase1[191:128],p8_sout_phase1[127:0]};  end
        if(ad_adlen==31) begin sout2_p8<={p8_sout_phase1[319:256]^{AD[127:64]},p8_sout_phase1[255:192]^{AD[63:8] , 8'h80                },p8_sout_phase1[191:128],p8_sout_phase1[127:0]};  end
        
        
        if(ad_adlen==32) begin sout2_p8<={p8_sout_phase2[319:256]^64'h8000_0000_0000_0000,p8_sout_phase2[255:0]};  end    

    end   
end



wire [319:0] temp_load_sout;
p8 u2(.clk(clk),.rst(rst),.s_in(sout2_p8),.s_out(temp_load_sout));



always@(posedge clk,negedge rst) begin
if(!rst)  ad_sout<=ad_sout;
else if(next_adlen==1) ad_sout<={ad_sin[319:64],ad_sin[63:0]^64'b1};
      else    ad_sout<={temp_load_sout[319:64],temp_load_sout[63:0]^64'b1}; 
end



     
endmodule

