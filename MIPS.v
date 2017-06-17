`timescale 1ns / 1ps

module MIPS ( Clk_O, Reset, Instruction, PC, LED, LEDten);
	input 		Clk_O, Reset;
	input [7:0]	Instruction;
	output[7:0] PC;
	output[6:0]	LED, LEDten;
	wire			Clk;
	
	// Program_Counter
	wire[7:0] 	PC, Next_PC;
	
	// Instruction Memory
	wire[7:0] 	Instruction;
	
	// Sign Extenstion
	wire[7:0]	Sign_Extended_Instruction;
	
	// Registers
	wire[7:0]	Read_Data1, Read_Data2, Reg_Write_Data;
	wire[1:0]	Write_Register;
	
	// Control Signals
	wire 			RegWrite, MemtoReg, Branch, MemRead, MemWrite, RegDst, ALUSrc;
	wire			ALUOp;
	
	// ALU
	wire[7:0]	ALU_SrcB, ALU_Result;
	
	// Jump Address
	wire[7:0]	Jump_Address;
	
	// Data Memory
	wire[7:0]	Read_Data;
	
	// fdemultiplier (make 1s)
	
	// Program_Counter			
	
	// Instruction_Memory
	
	// Sign Extension
	
	// Registers
	
	// Control Logic
	
	// Jump Address
	
	// ALU					  
	
	// Data Memory
	DMEM Data_Memory ( .Read_Data(Read_Data), .Write_Data(Read_Data2), .Address(ALU_Result), .MemRead(MemRead), .MemWrite(MemWrite), .Clear(Reset), .Clk(Clk_O) );
	
	// 7-segment decoder for the output
	decoder7seg LEDoneDecode ( .Binary(Reg_Write_Data[3:0]), .LED(LED) );
	decoder7seg LEDtenDecode ( .Binary(Reg_Write_Data[7:4]), .LED(LEDten) );
	
endmodule
