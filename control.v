`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:54 06/05/2017 
// Design Name: 
// Module Name:    control 
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
module control(
    input [1:0] in,
    output reg RegDst,
    output reg RegWrite,
    output reg ALUSrc,
    output reg Branch,
    output reg MemRead,
    output reg MemWrite,
    output reg MemtoReg,
    output reg ALUOp,
	 input Clear,
	 input Clk
    );

	always @(*) begin
		if (Clear) begin RegDst <= 0; RegWrite <= 0; ALUSrc <= 0; Branch <= 0; MemRead <= 0; MemWrite <= 0; MemtoReg <= 0; ALUOp <= 0; end
		else begin
			case (in)
				2'b00: begin RegDst <= 1; RegWrite <= 1; ALUSrc <= 0; Branch <= 0; MemRead <= 0; MemWrite <= 0; MemtoReg <= 0; ALUOp <= 1; end
				2'b01: begin RegDst <= 0; RegWrite <= 1; ALUSrc <= 1; Branch <= 0; MemRead <= 1; MemWrite <= 0; MemtoReg <= 1; ALUOp <= 1/*0*/; end
				2'b10: begin RegWrite <= 0; ALUSrc <= 1; Branch <= 0; MemRead <= 0; MemWrite <= 1; ALUOp <= 1/*0*/; end
				2'b11: begin RegWrite <= 0; ALUSrc <= 0; Branch <= 1; MemRead <= 0; MemWrite <= 0; ALUOp <= 0; end
			endcase
		end
	end
	
	initial begin
		RegDst <= 0; RegWrite <= 0; ALUSrc <= 0; Branch <= 0; MemRead <= 0; MemWrite <= 0; MemtoReg <= 0; ALUOp <= 0;
	end

endmodule
