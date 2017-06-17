`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:57 05/17/2017 
// Design Name: 
// Module Name:    Clkdiv 
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
module clkdiv(
    input Clk_O,
    input Clear,
    output reg Clk
    );

	reg [24:0] cnt;
	
	always @(negedge Clk_O or posedge Clear) begin
		if (Clear) begin
			cnt <= 0;
			Clk <= 0;
		end
		//else if (cnt >= 25'd99) begin
		else if (cnt >= 25'd24999999) begin
			cnt <= 0;
			Clk <= ~Clk;
		end
		else begin
			cnt <= cnt + 1;
		end
	end
	
	initial begin
		cnt = 0;
		Clk = 0;
	end

endmodule
