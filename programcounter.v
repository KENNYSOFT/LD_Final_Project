`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:13:39 06/05/2017 
// Design Name: 
// Module Name:    programcounter 
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
module programcounter(
    output reg [7:0] PC,
    input [7:0] Next_PC,
    input Clear,
    input Clk
    );

	always @(negedge Clk or posedge Clear) begin
		if (Clear) PC <= 0;
		else PC <= Next_PC;
	end

	initial begin
		PC = 0;
	end

endmodule
