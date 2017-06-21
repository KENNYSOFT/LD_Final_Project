`timescale 1ns / 1ps

module IMEM ( Instruction, Read_Address );

	output[7:0] Instruction;

	input	[7:0]	Read_Address;
	
	wire	[7:0]	MemByte[255:0];	// 6 words(bytes) of memory
	
	/*//// Test Set 1 ///
	// lw $s1, 0($s0)
	assign MemByte[0] = { 2'b01, 2'b00, 2'b01, 2'b00 };
	// s1 = Mem[s0+0] = Mem[0] = 0

	// lw $s2, 1($s0)
	assign MemByte[1] = { 2'b01, 2'b00, 2'b10, 2'b01 };
	// s2 = Mem[s0+1] = Mem[1] = 1
	
	// lw $s3, 1($s2)
	assign MemByte[2] = { 2'b01, 2'b10, 2'b11, 2'b01 };
	// s3 = Mem[s2+1] = Mem[2] = 2

	// add $s0, $s2, $s3
	assign MemByte[3] = { 2'b00, 2'b10, 2'b11, 2'b00 };
	// s0 = s2 + s3 = 3
	
	// add $s0, $s0, $s0
	assign MemByte[4] = { 2'b00, 2'b00, 2'b00, 2'b00 };
	// s0 = s0 + s0 = 6
	
	// lw $s0, 1($s0)
	assign MemByte[5] = { 2'b01, 2'b00, 2'b00, 2'b01 };
	// s0 = Mem[s0+1] = Mem[7] = 7
	
	// sw $s0, -2($s3)
	assign MemByte[6] = { 2'b10, 2'b11, 2'b00, 2'b10 };
	// Mem[s3-2] = Mem[0] = s0 = 7
	
	// lw $s1, -2($s3)
	assign MemByte[7] = { 2'b01, 2'b11, 2'b01, 2'b10 };
	// s1 = Mem[s3-2] = Mem[0] = 7
	
	// j -1
	assign MemByte[8] = { 2'b11, 4'b0000, 2'b11 };
	// => [8]*/
	
	//// Test Set 2 ///
	// j 0
	assign MemByte[0] = { 2'b11, 4'b0000, 2'b00 };
	// => [1]
	
	// lw $s1, 1($s0)
	assign MemByte[1] = { 2'b01, 2'b00, 2'b01, 2'b01 };
	// s1 = Mem[s0+1] = Mem[1] = 1
	
	// j 1
	assign MemByte[2] = { 2'b11, 4'b0000, 2'b01 };
	// => [4]

	// add $s1, $s1, $s1
	assign MemByte[3] = { 2'b00, 2'b01, 2'b01, 2'b01 };
	// s1 = s1 + s1 = 2, 4, 8, 0x10, 0x20, 0x40, 0x80, 0 (overflow)
	
	// j -2
	assign MemByte[4] = { 2'b11, 4'b0000, 2'b10 };
	// => [3]
			
	assign Instruction = MemByte[Read_Address];

endmodule

