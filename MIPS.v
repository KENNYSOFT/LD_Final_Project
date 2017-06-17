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
	clkdiv Frequency_Demultiplier(.CLK_IN(Clk_O), .clr(Reset), .CLK_OUT(Clk));
	
	// Program_Counter			
	programcounter Program_Counter(.PC(PC), .Next_PC(Next_PC), .Clear(Reset), .Clk(Clk));
	
	// Instruction_Memory
	//IMEM Instruction_Memory(.Instruction(Instruction), .Read_Address(PC));
	
	// Sign Extension
	signext SignExtension(.in(Instruction[1:0]), .out(Sign_Extended_Instruction), .Clear(Reset), .Clk(Clk_O));
	
	// Registers
	dest Destination(.RegDst(RegDst), .Instruction(Instruction), .Write_Register(Write_Register), .Clear(Reset), .Clk(Clk_O));
	
	reg[7:0] Write_Data;
	assign Reg_Write_Data = Write_Data;
	
	reg[7:0] Source_Data1;
	assign Read_Data1 = Source_Data1;
	
	reg[7:0] Source_Data2;
	assign Read_Data2 = Source_Data2;
	
	reg[7:0]	Registers[3:0];
	always @(posedge Clk_O or posedge Reset) begin
		if (Reset) begin Registers[0] = 0; Registers[1] = 0; Registers[2] = 0; Registers[3] = 0; end
		else begin
			Source_Data1 = Registers[Instruction[5:4]];
			Source_Data2 = Registers[Instruction[3:2]];
			Write_Data = (MemtoReg ? Read_Data2 : ALU_Result);
			if (RegWrite) Registers[Write_Register] = Write_Data;
		end
	end
	
	// Control Logic
	control Control(.in(Instruction[7:6]), .RegDst(RegDst), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .Branch(Branch), .MemRead(MemRead), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .Clear(Reset), .Clk(Clk_O));
	
	// Jump Address
	nextpc Jump(.Branch(Branch), .PC(PC), .Sign_Extended_Instruction(Sign_Extended_Instruction), .Next_PC(Next_PC), .Clear(Reset), .Clk(Clk_O));
	
	// ALU					  
	alu ALU(.Data1(Read_Data1), .Data2(ALUSrc ? Sign_Extended_Instruction : Read_Data2), .Result(ALU_Result), .Clear(Reset), .Clk(Clk_O));
	
	// Data Memory
	DMEM Data_Memory ( .Read_Data(Read_Data), .Write_Data(Read_Data2), .Address(ALU_Result), .MemRead(MemRead), .MemWrite(MemWrite), .Clear(Reset), .Clk(Clk_O) );
	
	// 7-segment decoder for the output
	decoder7seg LEDoneDecode ( .Binary(Reg_Write_Data[3:0]), .LED(LED) );
	decoder7seg LEDtenDecode ( .Binary(Reg_Write_Data[7:4]), .LED(LEDten) );
	
endmodule
