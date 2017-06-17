`timescale 1ns / 1ps

module MIPS_Test_v;

	// Inputs
	reg Clk_O;
	reg Reset;
	
	// Outputs
	wire [6:0] LED;
	wire [7:0] Instruction;
	wire [7:0] PC;
	
	// Instantiate the Unit Under Test (UUT)
	MIPS MIPS_student ( 
		.Clk_O(Clk_O),
		.Reset(Reset),
		.LED(LED),
		.Instruction(Instruction),
		.PC(PC)
	);
	
	IMEM instr_mem ( Instruction, PC );
	
	always #1 Clk_O = ~Clk_O;

	initial 
	begin
		Clk_O = 0;
		Reset = 1;
		
		#200 Reset = 0;
		
		Reset = 1;
		
		#200 Reset = 0;
		
		#1000000;
		
	end
      
endmodule

