`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:55 06/07/2017 
// Design Name: 
// Module Name:    register 
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
module register(
    input RegWrite,
    input [3:0] Instruction52,
    output reg [7:0] Read_Data1,
    output reg [7:0] Read_Data2,
    input [7:0] Reg_Write_Data,
    input [1:0] Write_Register,
    input Clear,
    input Clk
    );
	
	reg[7:0]	Registers[3:0];
	always @(*) begin
		if (Clear) begin Registers[0] <= 0; Registers[1] <= 0; Registers[2] <= 0; Registers[3] <= 0; end
		else begin
			Read_Data1 <= Registers[Instruction52[3:2]];
			Read_Data2 <= Registers[Instruction52[1:0]];
			if (RegWrite) Registers[Write_Register] <= Reg_Write_Data;
		end
	end
	
	initial begin
		Read_Data1 <= 0;
		Read_Data2 <= 0;
	end

endmodule
