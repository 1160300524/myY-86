`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/23 19:34:17
// Design Name: 
// Module Name: test
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


module test;

    reg clock;
    reg rs;
    wire cons=0;
    reg[2:0] sta=0;
    
    initial
    begin
        clock=1'b0;
        forever #10 clock=~clock;
    end
    
    initial
    begin
        rs=1'b0;
        #195 rs=1'b1;
        #1000 $stop;
    end
        
        contructure_wrapper tes(
                .W_stat(cons),
                .W_stat_1(cons),
                .clk(clock),
                .m_stat(sta),
                .rst(rs),
                .stat(sta)
        );
        

    
endmodule
