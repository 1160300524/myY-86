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
    input wire[3:0] waddr,  //д��ĵ�ַ
    input wire[`digitsBus] wdata,  //д������
    input wire we, //дʹ���ź�
    input wire re1,re2,   //�����ݵ�����ʹ���ź�
    input wire[3:0] raddr1,raddr2,  //���ĵ�ַ
    output reg[63:0] rdata1,rdata2  //����������
    );
    
    reg[63:0] regs[15:0];
    
    //д������
    always@(posedge clk)
    begin
        if(rst==0)
        begin
            if(we==1)
            begin
                regs[waddr]=wdata;
            end
        end
    end
    
    //�����Ĵ���1������
    always@(*)
    begin
        if(rst==0)
        begin
            rdata1<=`readZero;
        end
        else if(re1==1)
        begin
            if((we==1) && (raddr1==waddr))
            begin
                rdata1<=wdata;
            end
            else
            begin
                rdata1<=regs[raddr1];
            end
        end
        else
        begin
            rdata1<=`readZero;
        end
    end
    
    //�����Ĵ���2������
    always@(*)
        begin
            if(rst==0)
            begin
                rdata2<=`readZero;
            end
            else if(re2==1)
            begin
                if((we==1) && (raddr2==waddr))
                begin
                    rdata2<=wdata;
                end
                else
                begin
                    rdata2<=regs[raddr1];
                end
            end
            else
            begin
                rdata2<=`readZero;
            end
        end
endmodule
