/* 7-Segment Decoder */
module decoder7seg(Binary, LED);
   input [3:0] Binary;
   output [6:0] LED;

	reg [6:0] LED_L;

	always @(Binary) begin
		case (Binary)
			 8'b0000 : LED_L <= 7'b1000000;   //0
			 8'b0001 : LED_L <= 7'b1111001;   //1
			 8'b0010 : LED_L <= 7'b0100100;   //2
			 8'b0011 : LED_L <= 7'b0110000;   //3
			 8'b0100 : LED_L <= 7'b0011001;   //4
			 8'b0101 : LED_L <= 7'b0010010;   //5
			 8'b0110 : LED_L <= 7'b0000010;   //6
			 8'b0111 : LED_L <= 7'b1111000;   //7
			 8'b1000 : LED_L <= 7'b0000000;   //8
			 8'b1001 : LED_L <= 7'b0010000;   //9
			 8'b1010 : LED_L <= 7'b0001000;   //A
			 8'b1011 : LED_L <= 7'b0000011;   //b
			 8'b1100 : LED_L <= 7'b1000110;   //C
			 8'b1101 : LED_L <= 7'b0100001;   //d
			 8'b1110 : LED_L <= 7'b0000110;   //E
			 8'b1111 : LED_L <= 7'b0001110;   //F
			 default : 		LED_L <= 7'b1000000;   //0
		 endcase
	end
	
	assign LED = ~LED_L;
endmodule