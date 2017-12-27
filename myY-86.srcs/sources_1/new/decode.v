`timescale 1ns / 1ps
`include "const_defination.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/21 15:43:59
// Design Name: 
// Module Name: decode
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


module decode(
    input wire[`digitsBus] d_rvalA,
    input wire[`digitsBus] d_rvalB,
    input wire[`icodeBus] icode,
    input wire[`regBus] e_dstE,M_dstE,M_dstM,W_dstM,W_dstE,   //��E,M,W�׶δ�����д�ؼĴ����ĵ�ַ
    input wire[`digitsBus] e_valE,m_valM,M_valE,W_valM,W_valE, //��E,M,W�׶δ�����д�ؼĴ�����ֵ
    input wire[`regBus] srcA,srcB,
    input wire[`digitsBus] valP, //����valP��valA ����ͬʱ��ʹ�ã�����Ҫ���ںϲ�
    output reg[`digitsBus] valA,valB
    );
    
    //Sel+fwdA ����ָ���srcA   ѡ��Ӻ������̴��ͻ�����ֵ�ʹӼĴ����ж�����ֵ����E�Ĵ�����valA��
    always@(*)
    begin
        case({icode,4'h0})
            `call:
                begin
                    valA=valP;
                end
			`jmp:
                begin
                    valA=valP;
                end
			default:
			begin
				if(srcA==e_dstE)
				begin
					valA=e_valE;
				end
				else if(srcA==M_dstM)
				begin
					valA=m_valM;
				end
				else if(srcA==M_dstE)
				begin
					valA=M_valE;
				end
				else if(srcA==W_dstM)
				begin
					valA=W_valM;
				end
				else if(srcA==W_dstE)
				begin
					valA=W_valE;
				end
				else
				begin
					valA=d_rvalA;
				end
			end
        endcase
    end
    
    //fwdB ����ָ���srcB��ֵ  ѡ����ֵ�ʹӼĴ����ж�����valBֵ����E�Ĵ�����valA��
    always@(*)
        begin
            if(srcB==e_dstE)
            begin
                valB=e_valE;
            end
            else if(srcB==M_dstM)
            begin
                valB=m_valM;
            end
            else if(srcB==M_dstE)
            begin
                valB=M_valE;
            end
            else if(srcB==W_dstM)
            begin
                valB=W_valM;
            end
            else if(srcB==W_dstE)
            begin
                valB=W_valE;
            end
            else
            begin
                valB=d_rvalB;
            end
        end
    
endmodule
