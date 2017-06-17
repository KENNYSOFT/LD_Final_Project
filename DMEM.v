`timescale 1ns / 1ps

module DMEM ( state, Read_Data, Write_Data, Address, MemRead, MemWrite, Clear, Clk );

	input[2:0] state;

	output[7:0]	Read_Data;
	
	input[7:0]	Write_Data;
	input[7:0]	Address;
	input			MemRead, MemWrite, Clear, Clk;
	
	reg[7:0] 	MemByte[31:0];
	
	always @ ( posedge Clk or posedge Clear )
	begin
		if ( Clear )
		begin
			MemByte[0] <= 8'h00;
			MemByte[1] <= 8'h01;
			MemByte[2] <= 8'h02;
			MemByte[3] <= 8'h03;
			MemByte[4] <= 8'h04;
			MemByte[5] <= 8'h05;
			MemByte[6] <= 8'h06;
			MemByte[7] <= 8'h07;
			MemByte[8] <= 8'h08;
			MemByte[9] <= 8'h09;
			MemByte[10] <= 8'h0a;
			MemByte[11] <= 8'h0b;
			MemByte[12] <= 8'h0c;
			MemByte[13] <= 8'h0d;
			MemByte[14] <= 8'h0e;
			MemByte[15] <= 8'h0f;
			MemByte[16] <= 8'h00;
			MemByte[17] <= 8'hff;
			MemByte[18] <= 8'hfe;
			MemByte[19] <= 8'hfd;
			MemByte[20] <= 8'hfc;
			MemByte[21] <= 8'hfb;
			MemByte[22] <= 8'hfa;
			MemByte[23] <= 8'hf9;
			MemByte[24] <= 8'hf8;
			MemByte[25] <= 8'hf7;
			MemByte[26] <= 8'hf6;
			MemByte[27] <= 8'hf5;
			MemByte[28] <= 8'hf4;
			MemByte[29] <= 8'hf3;
			MemByte[30] <= 8'hf2;
			MemByte[31] <= 8'hf1;
		end
		else if ( state == 3'd3 && MemWrite )
		begin
			MemByte[Address] <= Write_Data;
		end
	end

	assign Read_Data = ( MemRead ) ? MemByte[Address] : 0;
	
	
endmodule
