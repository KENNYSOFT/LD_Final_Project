`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:16:16 06/05/2017 
// Design Name: 
// Module Name:    nextpc 
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
module nextpc(
    input [7:0] PC,
    output reg [7:0] Next_PC,
    input Clear,
    input Clk
    );

	always @(*) begin
		if (Clear) Next_PC <= 0;
		else Next_PC <= PC + 1;
	end
	
	initial begin
		Next_PC = 0;
	end

endmodule
