`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:57 05/17/2017 
// Design Name: 
// Module Name:    clkdiv 
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
    input CLK_IN,
	 input clr,
    output reg CLK_OUT
    );
	 
	 reg [31:0] cnt;
	 
	 always @(posedge CLK_IN or posedge clr) begin
		if(cnt == 32'd100) begin
			cnt <= 0;
			CLK_OUT <= ~CLK_OUT;
		end else begin
			cnt <= cnt + 1;
		end
		if(clr) begin
			cnt <= 32'd0;
			CLK_OUT <= 1'b0;
		end
		
	 end
	 
	 initial begin
		CLK_OUT = 0;
		cnt = 0;
	 end


endmodule