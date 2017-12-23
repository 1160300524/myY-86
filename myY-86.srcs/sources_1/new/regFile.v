`timescale 1ns / 1ps
`include "const_defination.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/21 14:20:42
// Design Name: 
// Module Name: regFile
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


module regFile(
    input wire rst,
    input wire clk,
    input wire[3:0] dstE,dstM,  //д��ĵ�ַ
    input wire[`digitsBus] M,E,  //д������
    input wire[3:0] srcA,srcB,  //���ĵ�ַ
    output reg[63:0] d_rvalA,d_rvalB  //����������
    );
    
    reg[63:0] regs[15:0];
    
    //E�׶� �õ��Ľ��д��Ĵ���
    always@(posedge clk)
    begin
        if(rst==0)
        begin
            if(dstM!=`NONE)
            begin
                regs[dstM]=M;
            end
        end
    end
    
    //M�׶� �õ��Ľ��д�ؼĴ���
    always@(posedge clk)
    begin
        if(rst==0)
        begin
            if(dstE!=`NONE)
            begin
                regs[dstE]=E;
            end
        end
    end   
    
    //��ȡ����,����߼�
    always@(*)
    begin
        if(rst==0)
        begin
            if(srcA!=`NONE)
            begin
                d_rvalA<=regs[srcA];
            end
        end 
    end
    
    
    always@(*)
    begin
        if(rst==0)
        begin
            if(srcB!=`NONE)
            begin
                d_rvalB<=regs[srcB];
            end
        end 
    end    
endmodule
