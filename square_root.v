`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:04:52 11/08/2021 
// Design Name: 
// Module Name:    square_root 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module square_root (
    output reg   [15:0] out,
    input        [7:0]  in);
	
	 reg [4:0]     i;
	 reg [15:0]    baza;
	 reg [31:0]    prod;
	 reg [15:0]    ins;
	
	
	 always @(*) begin
		 out = 0;
		 baza = 128;
		 for (i = 1; i <= 8; i = i+1) begin
			 out = out + baza;
			 if ((out * out) > in) begin
				  out = out - baza;
			 end
			 baza = baza >> 1;
		 end
		 
		 out = out << 8;
		 baza = 128;
		 ins = in << 8;
		 for (i = 1; i <= 8; i = i+1) begin
			 out = out + baza;
			 prod = out * out;
			 prod = prod >> 8;
			 if (prod >= ins) begin
				 out = out - baza;
			 end
			 baza = baza >> 1;
		 end
		 
	end

endmodule
