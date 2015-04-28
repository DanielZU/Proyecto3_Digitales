`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:03:28 04/19/2015 
// Design Name: 
// Module Name:    ValidacionL 
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
module ValidacionL(
    input wire [7:0] dato_in,
    input wire Listo,
    input wire rst,
    output reg [2:0] enable
    );
always @ *
	if (rst) begin
		enable= 2'b0;
		end
	else if(Listo) begin
		case(dato_in) 
			8'h1C: enable=2'b10;
			8'h3A: enable=2'b01;
			8'h32: enable=2'b00;
			default: enable=2'b00;
		endcase
		end
	else 
		enable=2'b00;	

endmodule
