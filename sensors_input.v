`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:01:50 11/08/2021 
// Design Name: 
// Module Name:    sensors_input 
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
module sensors_input (
   output reg    [7 : 0]   height,
   input         [7 : 0]   sensor1,
   input         [7 : 0]   sensor2,
   input         [7 : 0]   sensor3,
   input         [7 : 0]   sensor4);
	
	always @(*) begin  
		 height = 0;
		 if ((sensor1 == 0) || (sensor3 == 0)) begin
			 height = (sensor2 + sensor4 + 1) / 2;
		 end else if ((sensor2 == 0) || (sensor4 == 0)) begin
			 height = (sensor1 + sensor3 + 1) / 2;
		 end else begin
			 height = (sensor1 + sensor3 + sensor2 + sensor4 + 2) / 4;
		 end
	end
	
endmodule
