`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:50:47 06/05/2017 
// Design Name: 
// Module Name:    dest 
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
module dest(
    input RegDst,
    input [3:0] Instruction30,
    output reg [1:0] Write_Register,
    input Clear
    );

	always @(*) begin
		if (Clear) Write_Register <= 0;
		else begin
			if (RegDst) Write_Register <= Instruction30[1:0];
			else Write_Register <= Instruction30[3:2];
		end
	end
	
	initial begin
		Write_Register = 0;
	end

endmodule
