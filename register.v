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
    input [2:0] state,
    input RegWrite,
    input [3:0] Instruction52,
    output reg [7:0] Read_Data1,
    output reg [7:0] Read_Data2,
    input [7:0] Reg_Write_Data,
    input [1:0] Write_Register,
    input Clear,
    input Clk
    );
	
	reg[7:0] s0;
	reg[7:0] s1;
	reg[7:0] s2;
	reg[7:0] s3;
	
	always @(posedge Clk or posedge Clear) begin
		if (Clear) begin
			s0 <= 0;
			s1 <= 0;
			s2 <= 0;
			s3 <= 0;
			Read_Data1 <= 0;
			Read_Data2 <= 0;
		end
		else begin
			if (state == 3'd1) begin
				case (Instruction52[3:2])
					2'b00: Read_Data1 <= s0;
					2'b01: Read_Data1 <= s1;
					2'b10: Read_Data1 <= s2;
					2'b11: Read_Data1 <= s3;
					default: Read_Data1 <= 0;
				endcase
				case (Instruction52[1:0])
					2'b00: Read_Data2 <= s0;
					2'b01: Read_Data2 <= s1;
					2'b10: Read_Data2 <= s2;
					2'b11: Read_Data2 <= s3;
					default: Read_Data2 <= 0;
				endcase
			end
			else if (state == 3'd4) begin
				if (RegWrite) begin
					case (Write_Register)
						2'b00: s0 <= Reg_Write_Data;
						2'b01: s1 <= Reg_Write_Data;
						2'b10: s2 <= Reg_Write_Data;
						2'b11: s3 <= Reg_Write_Data;
					endcase
				end
			end
		end
	end
	
	initial begin
		s0 = 0;
		s1 = 0;
		s2 = 0;
		s3 = 0;
		Read_Data1 = 0;
		Read_Data2 = 0;
	end

endmodule
