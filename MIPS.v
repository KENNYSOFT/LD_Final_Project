`timescale 1ns / 1ps

module MIPS ( Clk_O, Reset, Instruction, PC, LED, LEDten, LEDPC, LEDPCten, LEDSC, LEDwrr, LEDs);
	input 		Clk_O, Reset;
	input [7:0]	Instruction;
	output[7:0] PC;
	output[6:0]	LED, LEDten, LEDPC, LEDPCten, LEDSC, LEDwrr;
	output[3:0] LEDs;
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
	
	// fsm
	reg[2:0] current_state;
	reg[2:0] next_state;
	parameter State_None = 3'd0;
	parameter State_Register_Read = 3'd1;
	parameter State_ALU = 3'd2;
	parameter State_Memory = 3'd3;
	parameter State_Register_Write = 3'd4;
	parameter State_Error = 3'd5;
	
	always @(*) begin
		case ({current_state, Clk})
			{State_None, 1'b0}: next_state = State_Register_Read;
			{State_None, 1'b1}: next_state = State_None;
			{State_Register_Read, 1'b0}: next_state = State_ALU;
			{State_Register_Read, 1'b1}: next_state = State_None;
			{State_ALU, 1'b0}: next_state = State_Memory;
			{State_ALU, 1'b1}: next_state = State_None;
			{State_Memory, 1'b0}: next_state = State_Register_Write;
			{State_Memory, 1'b1}: next_state = State_None;
			{State_Register_Write, 1'b0}: next_state = State_Register_Write;
			{State_Register_Write, 1'b1}: next_state = State_None;
			default: next_state = State_Error;
		endcase
	end
	
	always @(negedge Clk_O or posedge Reset) begin
		if (Reset) current_state = State_None;
		else current_state = next_state;
	end
	
	initial begin
		current_state = State_None;
	end
	
	// fdemultiplier (make 1s)
	clkdiv Frequency_Demultiplier(.Clk_O(Clk_O), .Clear(Reset), .Clk(Clk));
	
	// Program_Counter			
	mux MUX1(.Control(Branch), .in0(PC + 1'b1), .in1(Jump_Address), .out(Next_PC), .Clear(Reset));
	programcounter Program_Counter(.PC(PC), .Next_PC(Next_PC), .Clear(Reset), .Clk(Clk));
	
	// Instruction_Memory
	//IMEM Instruction_Memory(.Instruction(Instruction), .Read_Address(PC));
	
	// Sign Extension
	signext Sign_Extension(.in(Instruction[1:0]), .out(Sign_Extended_Instruction), .Clear(Reset));
	
	// Registers
	dest Destination(.RegDst(RegDst), .Instruction30(Instruction[3:0]), .Write_Register(Write_Register), .Clear(Reset));
	mux MUX2(.Control(MemtoReg), .in0(ALU_Result), .in1(Read_Data), .out(Reg_Write_Data), .Clear(Reset));
	register Register(.state(current_state), .RegWrite(RegWrite), .Instruction52(Instruction[5:2]), .Read_Data1(Read_Data1), .Read_Data2(Read_Data2), .Reg_Write_Data(Reg_Write_Data), .Write_Register(Write_Register), .Clear(Reset), .Clk(Clk_O));
	
	// Control Logic
	control Control(.in(Instruction[7:6]), .RegDst(RegDst), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .Branch(Branch), .MemRead(MemRead), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .Clear(Reset));
	
	// Jump Address
	jump Calc_Jump(.PC_Added(PC + 1'b1), .Sign_Extended_Instruction(Sign_Extended_Instruction), .Jump_Address(Jump_Address), .Clear(Reset));
	
	// ALU					  
	mux MUX3(.Control(ALUSrc), .in0(Read_Data2), .in1(Sign_Extended_Instruction), .out(ALU_SrcB), .Clear(Reset));
	alu ALU(.state(current_state), .ALUOp(ALUOp), .Data1(Read_Data1), .Data2(ALU_SrcB), .ALU_Result(ALU_Result), .Clear(Reset));
	
	// Data Memory
	DMEM Data_Memory (.state(current_state), .Read_Data(Read_Data), .Write_Data(Read_Data2), .Address(ALU_Result), .MemRead(MemRead), .MemWrite(MemWrite), .Clear(Reset), .Clk(Clk_O) );
	
	// 7-segment decoder for the output
	decoder7seg LEDoneDecode ( .Binary(Reg_Write_Data[3:0]), .LED(LED) );
	decoder7seg LEDtenDecode ( .Binary(Reg_Write_Data[7:4]), .LED(LEDten) );
	
	// additional
	decoder7seg LEDPConeDecode(.Binary(PC[3:0]), .LED(LEDPC));
	decoder7seg LEDPCtenDecode(.Binary(PC[7:4]), .LED(LEDPCten));
	assign LEDSC = 7'b1101101;
	decoder7seg LEDWriteRegister(.Binary({2'b00,Write_Register}), .LED(LEDwrr));
	//decoder7seg LEDDebug1Decode(.Binary(Read_Data1[7:4]), .LED(LEDPCten));
	//decoder7seg LEDDebug2Decode(.Binary(Read_Data1[3:0]), .LED(LEDPC));
	//decoder7seg LEDDebug3Decode(.Binary(Read_Data2[7:4]), .LED(LEDSC));
	//decoder7seg LEDDebug4Decode(.Binary(Read_Data2[3:0]), .LED(LEDwrr));
	assign LEDs[0] = ~Instruction[7] & ~Instruction[6];
	assign LEDs[1] = ~Instruction[7] & Instruction[6];
	assign LEDs[2] = Instruction[7] & ~Instruction[6];
	assign LEDs[3] = Instruction[7] & Instruction[6];
	
endmodule
