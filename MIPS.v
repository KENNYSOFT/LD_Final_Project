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
	clkdiv Frequency_Demultiplier(.CLK_IN(~Clk_O), .clr(Reset), .CLK_OUT(Clk));
	
	// Program_Counter			
	programcounter Program_Counter(.PC(PC), .Next_PC(Branch ? Jump_Address : Next_PC), .Clear(Reset), .Clk(~Clk));
	nextpc Calc_Next(.PC(PC), .Next_PC(Next_PC), .Clear(Reset), .Clk(Clk_O));
	// TODO: use mux
	
	// Instruction_Memory
	//IMEM Instruction_Memory(.Instruction(Instruction), .Read_Address(PC));
	
	// Sign Extension
	signext Sign_Extension(.in(Instruction[1:0]), .out(Sign_Extended_Instruction), .Clear(Reset), .Clk(Clk_O));
	
	// Registers
	dest Destination(.RegDst(RegDst), .Instruction30(Instruction[3:0]), .Write_Register(Write_Register), .Clear(Reset), .Clk(Clk_O));
	/*reg[7:0] Write_Data;
	assign Reg_Write_Data = Write_Data;
	
	always @(*) begin
		if (MemtoReg) Write_Data <= Read_Data;
		else Write_Data <= ALU_Result;
	end*/
	mux MUX2(.Control(MemtoReg), .in0(ALU_Result), .in1(Read_Data), .out(Reg_Write_Data), .Clear(Reset), .Clk(Clk_O));
	register Register(.RegWrite(RegWrite), .Instruction52(Instruction[5:2]), .Read_Data1(Read_Data1), .Read_Data2(Read_Data2), .Reg_Write_Data(Reg_Write_Data), .Write_Register(Write_Register), .Clear(Reset), .Clk(Clk_O));
	
	// Control Logic
	control Control(.in(Instruction[7:6]), .RegDst(RegDst), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .Branch(Branch), .MemRead(MemRead), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .Clear(Reset), .Clk(Clk_O));
	
	// Jump Address
	jump Calc_Jump(.PC(PC), .Sign_Extended_Instruction(Sign_Extended_Instruction), .Jump_Address(Jump_Address), .Clear(Reset), .Clk(Clk_O));
	
	// ALU					  
	/*reg[7:0] ALU_SrcB_Reg;
	assign ALU_SrcB = ALU_SrcB_Reg;
	
	always @(*) begin
		if (ALUSrc) ALU_SrcB_Reg <= Sign_Extended_Instruction;
		else ALU_SrcB_Reg <= Read_Data2;
	end*/
	mux MUX1(.Control(ALUSrc), .in0(Read_Data2), .in1(Sign_Extended_Instruction), .out(ALU_SrcB), .Clear(Reset), .Clk(Clk_O));
	alu ALU(.ALUOp(ALUOp), .Data1(Read_Data1), .Data2(ALU_SrcB), .ALU_Result(ALU_Result), .Clear(Reset), .Clk(Clk_O));
	
	// Data Memory
	DMEM Data_Memory ( .Read_Data(Read_Data), .Write_Data(Read_Data2), .Address(ALU_Result), .MemRead(MemRead), .MemWrite(MemWrite), .Clear(Reset), .Clk(Clk_O) );
	
	// 7-segment decoder for the output
	decoder7seg LEDoneDecode ( .Binary(Reg_Write_Data[3:0]), .LED(LED) );
	decoder7seg LEDtenDecode ( .Binary(Reg_Write_Data[7:4]), .LED(LEDten) );
	
	initial begin
		Write_Data = 0;
	end
	
endmodule
