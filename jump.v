`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:00 06/05/2017 
// Design Name: 
// Module Name:    jump 
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
module jump(
    input [7:0] PC,
    input [7:0] Sign_Extended_Instruction,
    output reg [7:0] Jump_Address,
    input Clear,
    input Clk
    );

	always @(*) begin
		if (Clear) Jump_Address <= 0;
		else Jump_Address <= PC + 1 + Sign_Extended_Instruction;
	end
	
	initial begin
		Jump_Address = 0;
	end

endmodule
