`timescale 1ns / 1ps

module IMEM ( Instruction, Read_Address );

	output[7:0] Instruction;

	input	[7:0]	Read_Address;
	
	wire	[7:0]	MemByte[255:0];	// 6 words(bytes) of memory
	
	//// Basic Operation Test Set ///
	// lw $s1, 0($s0)
	assign MemByte[0] = { 2'b01, 2'b00, 2'b01, 2'b00 };
	// s1 = 0

	// lw $s2, 1($s0)
	assign MemByte[1] = { 2'b01, 2'b00, 2'b10, 2'b01 };
	// s2 = 1

	// add $s0, $s1, $s2
	assign MemByte[2] = { 2'b00, 2'b01, 2'b10, 2'b00 };
	// s0 = 1
	
	// sw $s2, 1($s0)
	assign MemByte[3] = { 2'b10, 2'b00, 2'b10, 2'b01 };
	// Mem[2] = 1
	
	// j -1
	assign MemByte[4] = { 2'b11, 4'b0000, 2'b11 };
			
	assign Instruction = MemByte[Read_Address];

endmodule

