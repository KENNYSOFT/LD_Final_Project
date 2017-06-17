`timescale 1ns / 1ps

module MIPS_Test_v(
	input Clk_O,
	input Reset,
	output[6:0]	LED,
	output[6:0]	LEDten,
	output[6:0]	LEDPC,
	output[6:0]	LEDPCten,
	output[6:0]	LEDSC,
	output[6:0]	LEDwrr,
	output[3:0] LEDs);
	
	//reg Clk_O;
	//reg Reset;
	
	// Outputs
	wire [7:0] Instruction;
	wire [7:0] PC;
	
	// Instantiate the Unit Under Test (UUT)
	MIPS MIPS_student ( 
		.Clk_O(Clk_O),
		.Reset(Reset),
		.Instruction(Instruction),
		.PC(PC),
		.LED(LED),
		.LEDten(LEDten),
		.LEDPC(LEDPC),
		.LEDPCten(LEDPCten),
		.LEDSC(LEDSC),
		.LEDwrr(LEDwrr),
		.LEDs(LEDs)
	);
	
	IMEM instr_mem ( Instruction, PC );
	
	/*always #1 Clk_O = ~Clk_O;

	initial 
	begin
		Clk_O = 0;
		Reset = 1;
		
		#200 Reset = 0;
		
		Reset = 1;
		
		#200 Reset = 0;
		
		#1000000;
		
	end*/
      
endmodule

