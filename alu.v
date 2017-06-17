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
    input [7:0] Data1,
    input [7:0] Data2,
    output reg [7:0] Result,
    input Clear,
    input Clk
    );

	always @(posedge Clk or posedge Clear) begin
		if (Clear) Result <= 0;
		else Result <= Data1 + Data2;
	end

endmodule
