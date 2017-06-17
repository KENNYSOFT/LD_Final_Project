`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:06:19 06/05/2017 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(
    input [2:0] state,
    input ALUOp,
    input [7:0] Data1,
    input [7:0] Data2,
    output reg [7:0] ALU_Result,
    input Clear
    );

	always @(*) begin
		if (Clear) ALU_Result <= 0;
		else if (state == 3'd2) begin
			if (!ALUOp) ALU_Result <= 0;
			else ALU_Result <= Data1 + Data2;
		end
	end
	
	initial begin
		ALU_Result = 0;
	end

endmodule
