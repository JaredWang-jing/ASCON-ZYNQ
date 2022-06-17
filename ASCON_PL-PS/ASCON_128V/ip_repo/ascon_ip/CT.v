`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 20:10:45
// Design Name: 
// Module Name: CT
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


module CT(clk,rst,ct,ct_ad,ct_adlen,ct_sin,pt_out,sout2_final);
input [383:0] ct;
input clk,rst;
input [31:0] ct_ad,ct_adlen;
input [319:0] ct_sin;
output reg [255:0] pt_out;
output reg [319:0] sout2_final;




reg [319:0] ct_temp_sin; 
reg [31:0] ct_next_adlen;
reg [383:0] temp_ct;



wire [31:0] clen;
assign clen=ct_adlen-16;

//将clen打拍4个时钟周期
reg [31:0] temp_clen1,temp_clen2,temp_clen3,temp_clen4;
reg [319:0] temp_sin1,temp_sin2;

//always@(posedge clk,negedge rst) begin
always@(posedge clk) begin
temp_clen1<=clen;
temp_sin1<=ct_sin;
end

//always@(posedge clk,negedge rst) begin
always@(posedge clk) begin
temp_clen2<=temp_clen1;
temp_sin2<=temp_sin1;
end

//always@(posedge clk,negedge rst)
always@(posedge clk)
temp_clen3<=temp_clen2;

//always@(posedge clk,negedge rst)
always@(posedge clk)
temp_clen4<=temp_clen3;



//always@(posedge clk,negedge rst) begin
always@(posedge clk) begin
      if(ct)
        begin
            ct_next_adlen<=temp_clen4+1;
            ct_temp_sin<=temp_sin2;
            temp_ct<=ct;
        end
 end 


reg [319:0] p6_sin_phase1,p6_sin_phase2,p6_sin_phase3,p6_sin_phase4;
wire [319:0] p6_sout_phase1,p6_sout_phase2,p6_sout_phase3,p6_sout_phase4;

//配套换成next_adlen,ct_temp_sin
always@(ct_temp_sin,ct_next_adlen)
begin case(ct_next_adlen)
    9:begin
         p6_sin_phase1={temp_ct[191:128],ct_temp_sin[255:0]};
      end
    10:begin
         p6_sin_phase1={temp_ct[199:136],ct_temp_sin[255:0]};    
      end
    11:begin
         p6_sin_phase1={temp_ct[207:144],ct_temp_sin[255:0]};
      end
    12:begin
         p6_sin_phase1={temp_ct[215:152],ct_temp_sin[255:0]};
      end
    13:begin
         p6_sin_phase1={temp_ct[223:160],ct_temp_sin[255:0]};    
      end
    14:begin
         p6_sin_phase1={temp_ct[231:168],ct_temp_sin[255:0]};
      end
    15:begin
         p6_sin_phase1={temp_ct[239:176],ct_temp_sin[255:0]};
      end
    16:begin
         p6_sin_phase1={temp_ct[247:184],ct_temp_sin[255:0]};
      end
    
   
    17:begin
         p6_sin_phase1={temp_ct[255:192],ct_temp_sin[255:0]};
       end
    18:begin
         p6_sin_phase1={temp_ct[263:200],ct_temp_sin[255:0]};  
       end
    19:begin
         p6_sin_phase1={temp_ct[271:208],ct_temp_sin[255:0]};
       end
    20:begin
         p6_sin_phase1={temp_ct[279:216],ct_temp_sin[255:0]};  
       end    
       
          
    21:begin
         p6_sin_phase1={temp_ct[287:224],ct_temp_sin[255:0]};
       end
    22:begin
         p6_sin_phase1={temp_ct[295:232],ct_temp_sin[255:0]};  
       end
    23:begin
         p6_sin_phase1={temp_ct[303:240],ct_temp_sin[255:0]};
       end
    24:begin
         p6_sin_phase1={temp_ct[311:248],ct_temp_sin[255:0]};  
       end        
       
       
       
       
    25:begin
         p6_sin_phase1={temp_ct[319:256],ct_temp_sin[255:0]};  
       end
    26:begin
         p6_sin_phase1={temp_ct[327:264],ct_temp_sin[255:0]}; 
      end             
    27:begin
         p6_sin_phase1={temp_ct[335:272],ct_temp_sin[255:0]};  
       end
    28:begin
         p6_sin_phase1={temp_ct[343:280],ct_temp_sin[255:0]};  
       end  
       
       
       
    29:begin
         p6_sin_phase1={temp_ct[351:288],ct_temp_sin[255:0]}; 
       end
    30:begin
         p6_sin_phase1={temp_ct[359:296],ct_temp_sin[255:0]}; 
      end             
    31:begin
         p6_sin_phase1={temp_ct[367:304],ct_temp_sin[255:0]};
       end
    32:begin
         p6_sin_phase1={temp_ct[375:312],ct_temp_sin[255:0]}; 
       end         
              
    33:begin
         p6_sin_phase1={temp_ct[383:320],ct_temp_sin[255:0]};
       end 
        
    default:begin
                p6_sin_phase1= p6_sin_phase1;
            end     endcase
    end       

always@(p6_sout_phase1)
begin case(ct_next_adlen)
   17:begin
        p6_sin_phase2={temp_ct[191:128],p6_sout_phase1[255:0]};
      end
   18:begin
        p6_sin_phase2={temp_ct[199:136],p6_sout_phase1[255:0]};
      end
   19:begin
        p6_sin_phase2={temp_ct[207:144],p6_sout_phase1[255:0]};
      end
   20:begin 
        p6_sin_phase2={temp_ct[215:152],p6_sout_phase1[255:0]};
      end    
      
         
   21:begin
        p6_sin_phase2={temp_ct[223:160],p6_sout_phase1[255:0]};
      end
   22:begin
        p6_sin_phase2={temp_ct[231:168],p6_sout_phase1[255:0]};
      end
   23:begin
        p6_sin_phase2={temp_ct[239:176],p6_sout_phase1[255:0]};
      end
   24:begin
        p6_sin_phase2={temp_ct[247:184],p6_sout_phase1[255:0]};
      end        
      
      
      
      
   25:begin
        p6_sin_phase2={temp_ct[255:192],p6_sout_phase1[255:0]};
      end
   26:begin
        p6_sin_phase2={temp_ct[263:200],p6_sout_phase1[255:0]};
     end             
   27:begin
        p6_sin_phase2={temp_ct[271:208],p6_sout_phase1[255:0]};
      end
   28:begin
        p6_sin_phase2={temp_ct[279:216],p6_sout_phase1[255:0]};
      end  
      
      
      
   29:begin
        p6_sin_phase2={temp_ct[287:224],p6_sout_phase1[255:0]};
      end
   30:begin
        p6_sin_phase2={temp_ct[295:232],p6_sout_phase1[255:0]};
     end             
   31:begin
        p6_sin_phase2={temp_ct[303:240],p6_sout_phase1[255:0]};
      end
   32:begin
        p6_sin_phase2={temp_ct[311:248],p6_sout_phase1[255:0]};
      end         
             
   33:begin
        p6_sin_phase2={temp_ct[319:256],p6_sout_phase1[255:0]};  
      end 
       
   default:begin
               p6_sin_phase2= p6_sin_phase2;
           end     endcase
end   


always@(p6_sout_phase2)
begin   case(ct_next_adlen)
    25:begin
         p6_sin_phase3={temp_ct[191:128],p6_sout_phase2[255:0]};   
      end
    26:begin
         p6_sin_phase3={temp_ct[199:136],p6_sout_phase2[255:0]};   
      end             
    27:begin
         p6_sin_phase3={temp_ct[207:144],p6_sout_phase2[255:0]};   
       end
    28:begin
         p6_sin_phase3={temp_ct[215:152],p6_sout_phase2[255:0]};   
       end  
       
       
       
    29:begin
         p6_sin_phase3={temp_ct[223:160],p6_sout_phase2[255:0]};   
       end
    30:begin
         p6_sin_phase3={temp_ct[231:168],p6_sout_phase2[255:0]};   
      end             
    31:begin
         p6_sin_phase3={temp_ct[239:176],p6_sout_phase2[255:0]};   
       end
    32:begin
         p6_sin_phase3={temp_ct[247:184],p6_sout_phase2[255:0]};   
       end         
              
    33:begin
         p6_sin_phase3={temp_ct[255:192],p6_sout_phase2[255:0]};          
       end 
        
    default:begin
                p6_sin_phase3= p6_sin_phase3;
            end     endcase
end           
        
always@(p6_sout_phase3)
begin case(ct_next_adlen)
       33:begin
            p6_sin_phase4={temp_ct[191:128],p6_sout_phase3[255:0]};   
    end     
 default:begin
             p6_sin_phase4= p6_sin_phase4; 
         end     endcase
end   




p6 u1(.clk(clk),.rst(rst),.s_in(p6_sin_phase1),.s_out(p6_sout_phase1));
p6 u2(.clk(clk),.rst(rst),.s_in(p6_sin_phase2),.s_out(p6_sout_phase2));
p6 u3(.clk(clk),.rst(rst),.s_in(p6_sin_phase3),.s_out(p6_sout_phase3));
p6 u4(.clk(clk),.rst(rst),.s_in(p6_sin_phase4),.s_out(p6_sout_phase4));
  
  
 
always@(posedge clk,negedge rst)
begin if(!rst) 
    begin 
        pt_out<=pt_out;
        sout2_final<=sout2_final;
    end
  else begin case(ct_next_adlen)
            1:begin
                pt_out<=256'hffffffffffffffff_ffffffffffffffff_ffffffffffffffff_ffffffffffffffff;
                sout2_final<={ct_temp_sin[319:256]^64'h8000_0000_0000_0000,ct_temp_sin[255:0]};
              end
            2:begin
                pt_out<={248'b0,temp_ct[135:128]^ct_temp_sin[319:312]};
                sout2_final<={temp_ct[135:128],ct_temp_sin[311:256]^56'h80_0000_0000_0000,ct_temp_sin[255:0]};
              end           
            3:begin
                pt_out<={240'b0,temp_ct[143:128]^ct_temp_sin[319:304]};
                sout2_final<={temp_ct[143:128],ct_temp_sin[303:256]^48'h8000_0000_0000,ct_temp_sin[255:0]};
              end                         
            4:begin
                pt_out<={232'b0,temp_ct[151:128]^ct_temp_sin[319:296]};
                sout2_final<={temp_ct[151:128],ct_temp_sin[295:256]^40'h80_0000_0000,ct_temp_sin[255:0]};
              end                       
            5:begin
                pt_out<={224'b0,temp_ct[159:128]^ct_temp_sin[319:288]};
                sout2_final<={temp_ct[159:128],ct_temp_sin[287:256]^32'h8000_0000,ct_temp_sin[255:0]};
              end                       
            6:begin
                pt_out<={216'b0,temp_ct[167:128]^ct_temp_sin[319:280]};
                sout2_final<={temp_ct[167:128],ct_temp_sin[279:256]^24'h80_0000,ct_temp_sin[255:0]};
              end           
            7:begin
                pt_out<={208'b0,temp_ct[175:128]^ct_temp_sin[319:272]};
                sout2_final<={temp_ct[175:128],ct_temp_sin[271:256]^16'h8000,ct_temp_sin[255:0]};
              end                         
            8:begin
                pt_out<={200'b0,temp_ct[183:128]^ct_temp_sin[319:264]};
                sout2_final<={temp_ct[183:128],ct_temp_sin[263:256]^8'h80,ct_temp_sin[255:0]};
              end                       
            9:begin
                pt_out<={192'b0,temp_ct[191:128]^ct_temp_sin[319:256]};
                sout2_final<={p6_sout_phase1[319:256]^64'h8000_0000_0000_0000,p6_sout_phase1[255:0]};
              end  
  
              
            10:begin
                pt_out<={184'b0,temp_ct[199:136]^ct_temp_sin[319:256],temp_ct[135:128]^p6_sout_phase1[319:312]};                
                sout2_final<={temp_ct[135:128],p6_sout_phase1[311:256]^56'h80_0000_0000_0000,p6_sout_phase1[255:0]};
              end           
            11:begin
                pt_out<={176'b0,temp_ct[207:144]^ct_temp_sin[319:256],temp_ct[143:128]^p6_sout_phase1[319:304]};
                sout2_final<={temp_ct[143:128],p6_sout_phase1[303:256]^48'h8000_0000_0000,p6_sout_phase1[255:0]};
              end                         
            12:begin
                pt_out<={168'b0,temp_ct[215:152]^ct_temp_sin[319:256],temp_ct[151:128]^p6_sout_phase1[319:296]};
                sout2_final<={temp_ct[151:128],p6_sout_phase1[295:256]^40'h80_0000_0000,p6_sout_phase1[255:0]};
              end                       
            13:begin
                pt_out<={160'b0,temp_ct[223:160]^ct_temp_sin[319:256],temp_ct[159:128]^p6_sout_phase1[319:288]};
                sout2_final<={temp_ct[159:128],p6_sout_phase1[287:256]^32'h8000_0000,p6_sout_phase1[255:0]};
              end                       
            14:begin
                pt_out<={152'b0,temp_ct[231:168]^ct_temp_sin[319:256],temp_ct[167:128]^p6_sout_phase1[319:280]};
                sout2_final<={temp_ct[167:128],p6_sout_phase1[279:256]^24'h80_0000,p6_sout_phase1[255:0]};
              end           
            15:begin
                pt_out<={144'b0,temp_ct[239:176]^ct_temp_sin[319:256],temp_ct[175:128]^p6_sout_phase1[319:272]};
                sout2_final<={temp_ct[175:128],p6_sout_phase1[271:256]^16'h8000,p6_sout_phase1[255:0]};
              end                         
            16:begin
                pt_out<={136'b0,temp_ct[247:184]^ct_temp_sin[319:256],temp_ct[183:128]^p6_sout_phase1[319:264]};
                sout2_final<={temp_ct[183:128],p6_sout_phase1[263:256]^8'h80,p6_sout_phase1[255:0]};
              end                       
            17:begin
                pt_out<={128'b0,temp_ct[255:192]^ct_temp_sin[319:256],temp_ct[191:128]^p6_sout_phase1[319:256]};
                sout2_final<={p6_sout_phase2[319:256]^64'h8000_0000_0000_0000,p6_sout_phase2[255:0]};
              end             

 
            18:begin
                pt_out<={120'b0,temp_ct[263:200]^ct_temp_sin[319:256],temp_ct[199:136]^p6_sout_phase1[319:256],temp_ct[135:128]^p6_sout_phase2[319:312]};
                sout2_final<={temp_ct[135:128],p6_sout_phase2[311:256]^56'h80_0000_0000_0000,p6_sout_phase2[255:0]};
              end           
            19:begin
                pt_out<={112'b0,temp_ct[271:208]^ct_temp_sin[319:256],temp_ct[207:144]^p6_sout_phase1[319:256],temp_ct[143:128]^p6_sout_phase2[319:304]};
                sout2_final<={temp_ct[143:128],p6_sout_phase2[303:256]^48'h8000_0000_0000,p6_sout_phase2[255:0]};
              end                         
            20:begin
                pt_out<={104'b0,temp_ct[279:216]^ct_temp_sin[319:256],temp_ct[215:152]^p6_sout_phase1[319:256],temp_ct[151:128]^p6_sout_phase2[319:296]};
                sout2_final<={temp_ct[151:128],p6_sout_phase2[295:256]^40'h80_0000_0000,p6_sout_phase2[255:0]};
              end                       
            21:begin
                pt_out<={96'b0,temp_ct[287:224]^ct_temp_sin[319:256],temp_ct[223:160]^p6_sout_phase1[319:256],temp_ct[159:128]^p6_sout_phase2[319:288]};
                sout2_final<={temp_ct[159:128],p6_sout_phase2[287:256]^32'h8000_0000,p6_sout_phase2[255:0]};
              end                       
            22:begin
                pt_out<={88'b0,temp_ct[295:232]^ct_temp_sin[319:256],temp_ct[231:168]^p6_sout_phase1[319:256],temp_ct[167:128]^p6_sout_phase2[319:280]};
                sout2_final<={temp_ct[167:128],p6_sout_phase2[279:256]^24'h80_0000,p6_sout_phase2[255:0]};
              end           
            23:begin
                pt_out<={80'b0,temp_ct[303:240]^ct_temp_sin[319:256],temp_ct[239:176]^p6_sout_phase1[319:256],temp_ct[175:128]^p6_sout_phase2[319:272]};
                sout2_final<={temp_ct[175:128],p6_sout_phase2[271:256]^16'h8000,p6_sout_phase2[255:0]};
              end                         
            24:begin
                pt_out<={72'b0,temp_ct[311:248]^ct_temp_sin[319:256],temp_ct[247:184]^p6_sout_phase1[319:256],temp_ct[183:128]^p6_sout_phase2[319:264]};
                sout2_final<={temp_ct[183:128],p6_sout_phase2[263:256]^8'h80,p6_sout_phase2[255:0]};
              end                       
            25:begin
                pt_out<={64'b0,temp_ct[319:256]^ct_temp_sin[319:256],temp_ct[255:192]^p6_sout_phase1[319:256],temp_ct[191:128]^p6_sout_phase2[319:256]};
                sout2_final<={p6_sout_phase3[319:256]^64'h8000_0000_0000_0000,p6_sout_phase3[255:0]};
              end             


            26:begin
                pt_out<={56'b0,temp_ct[327:264]^ct_temp_sin[319:256],temp_ct[263:200]^p6_sout_phase1[319:256],temp_ct[199:136]^p6_sout_phase2[319:256],temp_ct[135:128]^p6_sout_phase3[319:312]};
                sout2_final<={temp_ct[135:128],p6_sout_phase3[311:256]^56'h80_0000_0000_0000,p6_sout_phase3[255:0]};
              end           
            27:begin
                  pt_out<={48'b0,temp_ct[335:272]^ct_temp_sin[319:256],temp_ct[271:208]^p6_sout_phase1[319:256],temp_ct[207:144]^p6_sout_phase2[319:256],temp_ct[143:128]^p6_sout_phase3[319:304]};
                sout2_final<={temp_ct[143:128],p6_sout_phase3[303:256]^48'h8000_0000_0000,p6_sout_phase3[255:0]};
              end                         
            28:begin
                pt_out<={40'b0,temp_ct[343:280]^ct_temp_sin[319:256],temp_ct[279:216]^p6_sout_phase1[319:256],temp_ct[215:152]^p6_sout_phase2[319:256],temp_ct[151:128]^p6_sout_phase3[319:296]};
                sout2_final<={temp_ct[151:128],p6_sout_phase3[295:256]^40'h80_0000_0000,p6_sout_phase3[255:0]};
              end                       
            29:begin
                pt_out<={32'b0,temp_ct[351:288]^ct_temp_sin[319:256],temp_ct[287:224]^p6_sout_phase1[319:256],temp_ct[223:160]^p6_sout_phase2[319:256],temp_ct[159:128]^p6_sout_phase3[319:288]};
                sout2_final<={temp_ct[159:128],p6_sout_phase3[287:256]^32'h8000_0000,p6_sout_phase3[255:0]};
              end                       
            30:begin
                pt_out<={24'b0,temp_ct[359:296]^ct_temp_sin[319:256],temp_ct[295:232]^p6_sout_phase1[319:256],temp_ct[231:168]^p6_sout_phase2[319:256],temp_ct[167:128]^p6_sout_phase3[319:280]};
                sout2_final<={p6_sout_phase3[319:280]|temp_ct[167:128],p6_sout_phase3[279:256]^24'h80_0000,p6_sout_phase3[255:0]};
              end           
            31:begin
                pt_out<={16'b0,temp_ct[367:304]^ct_temp_sin[319:256],temp_ct[303:240]^p6_sout_phase1[319:256],temp_ct[239:176]^p6_sout_phase2[319:256],temp_ct[175:128]^p6_sout_phase3[319:272]};
                sout2_final<={temp_ct[175:128],p6_sout_phase3[271:256]^16'h8000,p6_sout_phase3[255:0]};
              end                         
            32:begin
                 pt_out<={8'b0,temp_ct[375:312]^ct_temp_sin[319:256],temp_ct[311:248]^p6_sout_phase1[319:256],temp_ct[247:184]^p6_sout_phase2[319:256],temp_ct[183:128]^p6_sout_phase3[319:264]};
                sout2_final<={temp_ct[183:128],p6_sout_phase3[263:256]^8'h80,p6_sout_phase3[255:0]};
              end                       
            33:begin
                pt_out<={temp_ct[383:320]^ct_temp_sin[319:256],temp_ct[319:256]^p6_sout_phase1[319:256],temp_ct[255:192]^p6_sout_phase2[319:256],temp_ct[191:128]^p6_sout_phase3[319:256]};
                sout2_final<={p6_sout_phase4[319:256]^64'h8000_0000_0000_0000,p6_sout_phase4[255:0]};
               end    
    default:begin
                pt_out<=pt_out;
                sout2_final<=sout2_final;
            end     endcase
    end
end 
                                       
                       
endmodule
