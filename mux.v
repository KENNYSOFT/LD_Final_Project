`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:08 06/07/2017 
// Design Name: 
// Module Name:    mux 
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
module mux(
    input Control,
    input [7:0] in0,
    input [7:0] in1,
    output reg [7:0] out,
    input Clear
    );

	always @(*) begin
		if (Clear) out <= 0;
		else begin
			if (Control) out <= in1;
			else out <= in0;
		end
	end

	initial begin
		out = 0;
	end

endmodule
