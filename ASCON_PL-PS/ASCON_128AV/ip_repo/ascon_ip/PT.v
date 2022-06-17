`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 21:25:27
// Design Name: 
// Module Name: PT
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


module PT(pt_in,pt_adlen,clk,rst,pt_sin,cipher_out,pt_sout2_final);
input [31:0] pt_in;
input [319:0] pt_sin;
input [31:0] pt_adlen;
input clk,rst;
output reg [383:0] cipher_out;//这里的cipher_out只包含密文，低128位的标签，在顶层的时候结合
output reg [319:0] pt_sout2_final;




reg [319:0] temp_sin;
reg [5:0] next_adlen;
reg [255:0] PT=256'h0001020304050607_08090A0B0C0D0E0F_1011121314151617_18191A1B1C1D1E1F;
wire [319:0] p8_sin_phase1,p8_sin_phase2;
wire [319:0] p8_sout_phase1,p8_sout_phase2;




assign p8_sin_phase1={PT[255:128]^temp_sin[319:192],temp_sin[191:0]};
p8 p1(.clk(clk),.rst(rst),.s_in(p8_sin_phase1),.s_out(p8_sout_phase1));


assign p8_sin_phase2={PT[127:0]^p8_sout_phase1[319:192],p8_sout_phase1[191:0]};
p8 p2(.clk(clk),.rst(rst),.s_in(p8_sin_phase2),.s_out(p8_sout_phase2));





reg [31:0] temp_pt_adlen1,temp_pt_adlen2;

always@(posedge clk)
temp_pt_adlen1<=pt_adlen;

always@(posedge clk)
temp_pt_adlen2<=temp_pt_adlen1;


always@(posedge clk) begin
    if(pt_sin)
        next_adlen<=temp_pt_adlen2+1;
        temp_sin<=pt_sin;
 end 



always@(posedge clk,negedge rst)
begin
if(!rst)  begin 
        cipher_out<=cipher_out;  pt_sout2_final<=pt_sout2_final; 
      end
 else 
 begin 
        if(next_adlen==1) 
            begin
            cipher_out<=384'b0; 
            pt_sout2_final<={temp_sin[319:256]^64'h8000_0000_0000_0000,temp_sin[255:0]};  
            end
        if(next_adlen==2) 
            begin
            cipher_out<={248'b0,PT[255:248]^temp_sin[319:312],128'b0};
            pt_sout2_final<={{PT[255:248],56'h0}^temp_sin[319:256]^64'h0080_0000_0000_0000,temp_sin[255:0]}; 
            end
        if(next_adlen==3) 
            begin
            cipher_out<={240'b0,PT[255:240]^temp_sin[319:304],128'b0}; 
            pt_sout2_final<={{PT[255:240],48'h0}^temp_sin[319:256]^64'h0000_8000_0000_0000,temp_sin[255:0]};
            end
        if(next_adlen==4) 
            begin
            cipher_out<={232'b0,PT[255:232]^temp_sin[319:296],128'b0}; 
            pt_sout2_final<={{PT[255:232],40'h0}^temp_sin[319:256]^64'h0000_0080_0000_0000,temp_sin[255:0]}; 
            end  
        if(next_adlen==5) 
            begin
            cipher_out<={224'b0,PT[255:224]^temp_sin[319:288],128'b0}; 
            pt_sout2_final<={{PT[255:224],32'h0}^temp_sin[319:256]^64'h0000_0000_8000_0000,temp_sin[255:0]}; 
            end
        if(next_adlen==6) 
            begin
            cipher_out<={216'b0,PT[255:216]^temp_sin[319:280],128'b0}; 
            pt_sout2_final<={{PT[255:216],24'h0}^temp_sin[319:256]^64'h0000_0000_0080_0000,temp_sin[255:0]}; 
            end
        if(next_adlen==7) 
            begin
            cipher_out<={208'b0,PT[255:208]^temp_sin[319:272],128'b0}; 
            pt_sout2_final<={{PT[255:208],16'h0}^temp_sin[319:256]^64'h0000_0000_0000_8000,temp_sin[255:0]};
            end
        if(next_adlen==8) 
            begin
            cipher_out<={200'b0,PT[255:200]^temp_sin[319:264],128'b0}; 
            pt_sout2_final<={{PT[255:200],8'h0 }^temp_sin[319:256]^64'h0000_0000_0000_0080,temp_sin[255:0]};
            end
            
        if(next_adlen==9) 
            begin
            cipher_out<={192'b0,PT[255:192]^temp_sin[319:256],128'b0}; 
            pt_sout2_final<={temp_sin[319:192]^{PT[255:192],64'h8000_0000_0000_0000},temp_sin[191:0]};        
            end
        
        
        if(next_adlen==10 ) 
            begin
                cipher_out<={184'b0,PT[255:184]^temp_sin[319:248],128'b0};
                pt_sout2_final<={temp_sin[319:192]^{PT[255:184],56'h80_0000_0000_0000},temp_sin[191:0]};
            end
        if(next_adlen==11) 
            begin
                cipher_out<={176'b0,PT[255:176]^temp_sin[319:240],128'b0};
                pt_sout2_final<={temp_sin[319:192]^{PT[255:176],48'h8000_0000_0000},temp_sin[191:0]};
            end
        if(next_adlen==12) 
            begin
                cipher_out<={168'b0,PT[255:168]^temp_sin[319:232],128'b0};
                pt_sout2_final<={temp_sin[319:192]^{PT[255:168],40'h80_0000_0000},temp_sin[191:0]};
            end
        if(next_adlen==13) 
            begin
                cipher_out<={160'b0,PT[255:160]^temp_sin[319:224],128'b0};
                pt_sout2_final<={temp_sin[319:192]^{PT[255:160],32'h8000_0000},temp_sin[191:0]};
            end
        if(next_adlen==14) 
            begin
                cipher_out<={152'b0,PT[255:152]^temp_sin[319:216],128'b0};
                pt_sout2_final<={temp_sin[319:192]^{PT[255:152],24'h80_0000},temp_sin[191:0]};
            end
        if(next_adlen==15) 
            begin
                cipher_out<={144'b0,PT[255:144]^temp_sin[319:208],128'b0};
                pt_sout2_final<={temp_sin[319:192]^{PT[255:144],16'h8000},temp_sin[191:0]};
            end           
        if(next_adlen==16) 
            begin
                cipher_out<={136'b0,PT[255:136]^temp_sin[319:200],128'b0};
                pt_sout2_final<={temp_sin[319:192]^{PT[255:136],8'h80},temp_sin[191:0]};
            end
            
            
        if(next_adlen==17) 
            begin
                cipher_out<={128'b0,PT[255:128]^temp_sin[319:192],128'b0}; 
                pt_sout2_final<={p8_sout_phase1[319:256]^64'h8000_0000_0000_0000,p8_sout_phase1[255:0]};  
            end

        
        if(next_adlen==18)
            begin
                cipher_out<={120'b0,PT[255:128]^temp_sin[319:192],PT[127:120]^p8_sout_phase1[319:312],128'b0}; 
                pt_sout2_final<={{PT[127:120],56'h80_0000_0000_0000}^p8_sout_phase1[319:256],p8_sout_phase1[255:0]};  
            end
            
            
        if(next_adlen==19)
            begin
                cipher_out<={112'b0,PT[255:128]^temp_sin[319:192],PT[127:112]^p8_sout_phase1[319:304],128'b0};                 
                pt_sout2_final<={{PT[127:112],48'h8000_0000_0000}^p8_sout_phase1[319:256],p8_sout_phase1[255:0]};           
            end
        if(next_adlen==20)
            begin
                cipher_out<={104'b0,PT[255:128]^temp_sin[319:192],PT[127:104]^p8_sout_phase1[319:296],128'b0}; 
                pt_sout2_final<={{PT[127:104],40'h80_0000_0000}^p8_sout_phase1[319:256],p8_sout_phase1[255:0]};  
            end
        if(next_adlen==21)
            begin
                cipher_out<={96'b0,PT[255:128]^temp_sin[319:192],PT[127:96]^p8_sout_phase1[319:288],128'b0}; 
                pt_sout2_final<={{PT[127:96],32'h8000_0000}^p8_sout_phase1[319:256],p8_sout_phase1[255:0]}; 
            end
        if(next_adlen==22)
            begin
                cipher_out<={88'b0,PT[255:128]^temp_sin[319:192],PT[127:88]^p8_sout_phase1[319:280],128'b0}; 
                pt_sout2_final<={{PT[127:88],24'h80_0000}^p8_sout_phase1[319:256],p8_sout_phase1[255:0]}; 
            end
        if(next_adlen==23)
            begin
                cipher_out<={80'b0,PT[255:128]^temp_sin[319:192],PT[127:80]^p8_sout_phase1[319:272],128'b0}; 
                pt_sout2_final<={{PT[127:80],16'h8000}^p8_sout_phase1[319:256],p8_sout_phase1[255:0]}; 
            end            
        if(next_adlen==24)
            begin
                cipher_out<={72'b0,PT[255:128]^temp_sin[319:192],PT[127:72]^p8_sout_phase1[319:264],128'b0}; 
                pt_sout2_final<={{PT[127:72],8'h80}^p8_sout_phase1[319:256],p8_sout_phase1[255:0]}; 
            end
 
 
            
            
        if(next_adlen==25)
            begin
            cipher_out<={64'b0,PT[255:128]^temp_sin[319:192],PT[127:64]^p8_sout_phase1[319:256],128'b0};  
            pt_sout2_final<={p8_sout_phase1[319:192]^{PT[127:64],64'h8000_0000_0000_0000},p8_sout_phase1[191:0]};   
            end   
            
            
        if(next_adlen==26) 
            begin
            cipher_out<={56'b0,PT[255:128]^temp_sin[319:192],PT[127:56]^p8_sout_phase1[319:248],128'b0};  
            pt_sout2_final<={p8_sout_phase1[319:192]^{PT[127:56],56'h80_0000_0000_0000},p8_sout_phase1[191:0]};   
            end
            
            
            
        if(next_adlen==27) 
            begin
            cipher_out<={48'b0,PT[255:128]^temp_sin[319:192],PT[127:48]^p8_sout_phase1[319:240],128'b0};  
            pt_sout2_final<={p8_sout_phase1[319:192]^{PT[127:48],48'h8000_0000_0000},p8_sout_phase1[191:0]};
            end
        if(next_adlen==28) 
            begin
            cipher_out<={40'b0,PT[255:128]^temp_sin[319:192],PT[127:40]^p8_sout_phase1[319:232],128'b0};  
            pt_sout2_final<={p8_sout_phase1[319:192]^{PT[127:40],40'h80_0000_0000},p8_sout_phase1[191:0]};
            end
        if(next_adlen==29) 
            begin 
            cipher_out<={32'b0,PT[255:128]^temp_sin[319:192],PT[127:32]^p8_sout_phase1[319:224],128'b0};  
            pt_sout2_final<={p8_sout_phase1[319:192]^{PT[127:32],32'h8000_0000},p8_sout_phase1[191:0]};
            end
        if(next_adlen==30) 
            begin
            cipher_out<={24'b0,PT[255:128]^temp_sin[319:192],PT[127:24]^p8_sout_phase1[319:216],128'b0};  
            pt_sout2_final<={p8_sout_phase1[319:192]^{PT[127:24],24'h80_0000},p8_sout_phase1[191:0]};
            end
        if(next_adlen==31) 
            begin 
            cipher_out<={16'b0,PT[255:128]^temp_sin[319:192],PT[127:16]^p8_sout_phase1[319:208],128'b0};  
            pt_sout2_final<={p8_sout_phase1[319:192]^{PT[127:16],16'h8000},p8_sout_phase1[191:0]};
            end
        if(next_adlen==32) 
            begin
            cipher_out<={8'b0,PT[255:128]^temp_sin[319:192],PT[127:8]^p8_sout_phase1[319:200],128'b0};  
            pt_sout2_final<={p8_sout_phase1[319:192]^{PT[127:8],8'h80},p8_sout_phase1[191:0]};
            end
            
            
            
        if(next_adlen==33) 
            begin
            cipher_out<={PT[255:128]^temp_sin[319:192],p8_sout_phase1[319:192]^PT[127:0],128'b0};     
            pt_sout2_final<={p8_sout_phase2[319:256]^64'h8000_0000_0000_0000,p8_sout_phase2[255:0]};  
            end    
     end
 

end

        
endmodule
