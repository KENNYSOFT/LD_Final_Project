`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:20:48 06/05/2017 
// Design Name: 
// Module Name:    signext 
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
module signext(
    input [1:0] in,
    output reg [7:0] out,
    input Clear,
    input Clk
    );

	always @(*) begin
		if (Clear) out <= 0;
		else out <= {in[1], in[1], in[1], in[1], in[1], in[1], in};
	end
	
	initial begin
		out = 0;
	end

endmodule
