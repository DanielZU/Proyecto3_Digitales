`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:29:07 03/31/2015 
// Design Name: 
// Module Name:    Multiplicacion 
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
module Multiplicacion #(parameter size=21, parameter sign=1, parameter pf=15, parameter mag=5)
	(
		input wire signed [size-1:0] A, B,
		//input wire clk,
		output wire signed [size-1:0] Multi //wire->reg
    );
	 
reg signed[size*2-1:0] Multg;

always @ *
begin
	Multg=A*B;
	if (A=={size{1'b0}} | B=={size{1'b0}})
		Multg={(size*2){1'b0}};
	else
	begin
		if(A[size-1]==B[size-1]) 
		begin
			if(|Multg[size*2-1:size*2-1-sign*2-mag+1])
				Multg[size*2-sign*2-mag:pf]={1'b0,{(size-1){1'b1}}};
		end
		else 
		begin
			if(~&Multg[size*2-1:size*2-1-sign*2-mag+1])
				Multg[size*2-sign*2-mag:pf]={1'b1,{(size-1){1'b0}}};
		end
	end
end

assign Multi=Multg[size*2-sign*2-mag:pf];

//always @ (posedge clk)
//begin
//	Multi<=Multg[size*2-sign*2-mag:pf];
//end

endmodule
