`timescale 1ns / 1ps

module IMEM ( Instruction, Read_Address );

	output[7:0] Instruction;

	input	[7:0]	Read_Address;
	
	wire	[7:0]	MemByte[255:0];	// 6 words(bytes) of memory
	
	//// Basic Operation Test Set ///
	/*
	// lw $s1, 0($s0)
	assign MemByte[0] = { 2'b01, 2'b00, 2'b01, 2'b00 };
	// s1 = Mem[s0+0] = Mem[0] = 0

	// lw $s2, 1($s0)
	assign MemByte[1] = { 2'b01, 2'b00, 2'b10, 2'b01 };
	// s2 = Mem[s0+1] = Mem[1] = 1

	// add $s0, $s1, $s2
	assign MemByte[2] = { 2'b00, 2'b01, 2'b10, 2'b00 };
	// s0 = s1 + s2 = 1
	
	// sw $s2, 1($s0)
	assign MemByte[3] = { 2'b10, 2'b00, 2'b10, 2'b01 };
	// Mem[s0 + 1] = Mem[2] = s2 = 1
	
	//// j -1
	//assign MemByte[4] = { 2'b11, 4'b0000, 2'b11 };
	// j -2
	assign MemByte[4] = { 2'b11, 4'b0000, 2'b10 };
	*/
	
	/* Instruction Test Set 1 (from HY)
	// lw $s1, 1($s0)      // $s1 = Mem[$s0+1] = Mem[1] = 1; : 01
	assign MemByte[0] = { 2'b01, 2'b00, 2'b01, 2'b01 };
	
	// sw $s1, 0($s0)      // Mem[$s0+0] = Mem[0] = $s1 = 1; : 00
	assign MemByte[1] = { 2'b10, 2'b00, 2'b01, 2'b00 };
	
	// lw $s2, 1($s0)      // $s2 = Mem[$s0+1] = Mem[1] = 1; : 01
	assign MemByte[2] = { 2'b01, 2'b00, 2'b10, 2'b01 };
		
	// add $s3, $s2, $s1   // $s3 = $s2 + $s1 = 2 : 02
	assign MemByte[3] = { 2'b00, 2'b10, 2'b01, 2'b11 };
	
	// add $s2, $s3, $s2   // $s2 = $s3 + $s2 = 3 : 03
	assign MemByte[4] = { 2'b00, 2'b11, 2'b10, 2'b10 };
	
	// add $s3, $s3, $s2   // $s2 = $s3 + $s2 = 5 : 05
	assign MemByte[5] = { 2'b00, 2'b11, 2'b10, 2'b10 };
	
	// add $s1, $s2, $s3   // $s1 = $s2 + $s3 = 7 : 07
	assign MemByte[6] = { 2'b00, 2'b10, 2'b11, 2'b01 };
	
	// sw $s1, 1($s0)      // Mem[$s0+1] = Mem[1] = $s1 = 7 : 01
	assign MemByte[7] = { 2'b10, 2'b00, 2'b01, 2'b01 };
	
	// lw $s3, 1($s0)      // $s3 = Mem[1] = 7 : 07
	assign MemByte[8] = { 2'b01, 2'b00, 2'b11, 2'b01 };
	
	// add $s2, $s1, $s3   // $s2 = $s1 + $s3 = 14 = E : 0E
	assign MemByte[9] = { 2'b00, 2'b01, 2'b11, 2'b10 };
	
	// lw $s1, 0($s0)      // $s1 = Mem[0] = 1 : 01
	assign MemByte[10] = { 2'b01, 2'b00, 2'b01, 2'b00 };
	
	// add $s2, $s1, $s2   // $s2 = $s1 + $s2 = 15 = F : 0F
	assign MemByte[11] = { 2'b00, 2'b01, 2'b10, 2'b10 };
	
	// add $s2, $s1, $s2   // $s2 = $s1 + $s2 = 16 = 2'h10 : 10
	assign MemByte[12] = { 2'b00, 2'b01, 2'b10, 2'b10 };
	
	// add $s2, $s1, $s2   // $s2 = $s1 + $s2 = 17 = 2'h11 : 11
	assign MemByte[13] = { 2'b00, 2'b01, 2'b10, 2'b10 };
	
	// add $s2, $s1, $s2   // $s2 = $s1 + $s2 = 18 = 2'h12 : 12
	assign MemByte[14] = { 2'b00, 2'b01, 2'b10, 2'b10 };
	
	// lw $s3, -1($s2)      // $s3 = Mem[18-1] = -1 : FF
	assign MemByte[15] = { 2'b01, 2'b10, 2'b11, 2'b11 };
	
	// add $s1, $s2, $s3   // $s1 = $s2 + $s3 = 17 = 2'h11 : 11(?)
	assign MemByte[16] = { 2'b00, 2'b10, 2'b11, 2'b01 };
	
	// lw $s2, 1($s2)      // $s2 = Mem[18+1] = -3 : FD
	assign MemByte[17] = { 2'b01, 2'b10, 2'b10, 2'b01 };
	
	// add $s1, $s2, $s3   // $s1 = $s2 + $s3 = -4 : FC
	assign MemByte[18] = { 2'b00, 2'b10, 2'b11, 2'b01 };
	
	// sw $s1, 0($s0)      // Mem[$s0+0] = $s1 : 00
	assign MemByte[19] = { 2'b10, 2'b00, 2'b01, 2'b00 };
	*/
	
	// Instruction Test Set 2 (from SY)
	// lw $s1 1($s0)   // $s1 = Mem[$s0 + 1] = Mem[1] = 1 : 01
	assign MemByte[0] = { 2'b01, 2'b00, 2'b01, 2'b01 };
	
	// lw $s2 1($s1)   // $s2 = Mem[$s1 + 1] = Mem[2] = 2 : 02
	assign MemByte[1] = { 2'b01, 2'b01, 2'b10, 2'b01 };
	
	// add $s3 $s1 $s2 // $s3 = $s1 + $s2 = 3 : 03
	assign MemByte[2] = { 2'b00, 2'b01, 2'b10, 2'b11 };
	
	// add $s3 $s2 $s3   // $s3 = $s2 + $s3 = 5 : 05
	assign MemByte[3] = { 2'b00, 2'b10, 2'b11, 2'b11 };
	
	// add $s3 $s2 $s3 // $s3 = $s2 + $s3 = 2+5 = 7 : 07
	assign MemByte[4] = { 2'b00, 2'b10, 2'b11, 2'b11 };
	
	// add $s2 $s1 $s2 // $s2 = $s1 + $s2 = 3 : 03
	assign MemByte[5] = { 2'b00, 2'b01, 2'b10, 2'b10 };
	
	// add $s1 $s2 $s3 // $s1 = $s2 + $s3 = 10 : 0A
	assign MemByte[6] = { 2'b00, 2'b10, 2'b11, 2'b01 };
	
	// j + 1 : DC
	assign MemByte[7] = { 2'b11, 2'b00, 2'b00, 2'b01 };
	
	// add $s1 $s0 $s3   // jumpµÇŸß ÇÏŽÂ Ÿ²·¹±â instruction : --
	assign MemByte[8] = { 2'b00, 2'b00, 2'b11, 2'b01 };
	
	// add $s2 $s1 $s3 // $s2 = $s1 + $s3 = 17 : 11
	assign MemByte[9] = { 2'b00, 2'b01, 2'b11, 2'b10 };
	
	// lw $s3 0($s2)   // $s3 = Mem[$s2 + 0] = Mem[17] = -1 : FF
	assign MemByte[10] = { 2'b01, 2'b10, 2'b11, 2'b00 };

	// add $s1 $s1 $s3 // $s1 = $s1 + $s3 = 9 : 09 08 07 ...
	assign MemByte[11] = { 2'b00, 2'b01, 2'b11, 2'b01 };

	// j - 2 : DC
	assign MemByte[12] = { 2'b11, 2'b00, 2'b00, 2'b10 };
			
	assign Instruction = MemByte[Read_Address];

endmodule

