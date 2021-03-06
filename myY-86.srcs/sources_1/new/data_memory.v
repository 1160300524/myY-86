`timescale 1ns / 1ps
`include "const_defination.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/21 20:09:42
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input clk,
    input wire enabler,enablew,
    input wire[`digitsBus] dstM,
    input wire [`digitsBus] data,
	output reg dmem_error,
    output reg[`digitsBus ] valM
    );
    
    reg[`digitsBus] memory_data[`data_memory_size];
    
    always@(posedge clk)
    begin
        if(enablew==1)
        begin
			if(dstM>=`data_memory_length)
			begin
				dmem_error<=1;
			end
			else
			begin
				dmem_error<=0;
				memory_data[dstM]<=data;
			end
        end
    end
    
    always@(*)
    begin
		if(enabler==1&&enablew==1)
		begin
			if(dstM>=`data_memory_length)
			begin
				dmem_error<=1;
				valM<=data;
			end
			else
			begin
				dmem_error<=0;
				valM<=data;
			end
		end
		else if(enabler==1)
		begin
			if(dstM>=`data_memory_length)
			begin
				dmem_error<=1;
				valM<=0;
			end
			else
			begin
				valM<=memory_data[dstM];
				dmem_error<=0;
			end
		end
		else
		begin
			dmem_error<=0;
			valM<=0;
		end
    end
endmodule
