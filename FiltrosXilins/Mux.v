`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:58:29 04/21/2015 
// Design Name: 
// Module Name:    Mux 
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
module Mux #(parameter size=21)
	(
		input wire [size-1:0] A, B, C,
		input wire [1:0] Select,
		output wire [size-1:0] Salida
    );

assign Salida=(Select==2'b00) ? A :
				  (Select==2'b01) ? B :
				  (Select==2'b10) ? C : A;

endmodule
