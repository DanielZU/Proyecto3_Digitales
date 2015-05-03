`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:49 04/27/2015 
// Design Name: 
// Module Name:    Filtro 
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
module Filtro #(parameter size=22, parameter sign=1, parameter pf=14, parameter mag=7)
	(
		input wire signed [size-1:0] u, a1, a2, b0, b1, b2,
		input clk, rst, EN,
		output wire signed [size-1:0] y
    );

wire signed [size-1:0] ma1, ma2, mb0, mb1, mb2, yk, fk, sa1, sb1, fk1, fk2;

Sumador #(size,sign,pf,mag)
	Sumador_uk(
    .A(u), 
    .B(sa1),
	 //.clk(clk),	
	 //.rst(rst),
    .D(fk)
    );

Sumador #(size,sign,pf,mag)
	Sumador_a1(
    .A(ma1), 
    .B(ma2),
	 //.clk(clk),	
	 //.rst(rst),
    .D(sa1)
    );
	 
Sumador #(size,sign,pf,mag)
	Sumador_b0(
    .A(mb0), 
    .B(sb1), 
	 //.clk(clk),	
	 //.rst(rst),
    .D(yk)
    );

Sumador #(size,sign,pf,mag)
	Sumador_b1(
    .A(mb1), 
    .B(mb2), 
	 //.clk(clk),	
	 //.rst(rst),
    .D(sb1)
    );

Multiplicacion #(size,sign,pf,mag) 
	Multiplicacion_a1(
    .A(a1), 
    .B(fk1), 
	 //.clk(clk),	
	 //.rst(rst),
    .Multi(ma1)
    );

Multiplicacion #(size,sign,pf,mag) 
	Multiplicacion_a2(
    .A(a2), 
    .B(fk2), 
	 //.clk(clk),	
	 //.rst(rst),
    .Multi(ma2)
    );
	 
Multiplicacion #(size,sign,pf,mag) 
	Multiplicacion_b0(
    .A(b0), 
    .B(fk), 
	 //.clk(clk),	
	 //.rst(rst),
    .Multi(mb0)
    );
	 
Multiplicacion #(size,sign,pf,mag) 
	Multiplicacion_b1(
    .A(b1), 
    .B(fk1), 
	 //.clk(clk),	
	 //.rst(rst),
    .Multi(mb1)
    );
	 
Multiplicacion #(size,sign,pf,mag) 
	Multiplicacion_b2(
    .A(b2), 
    .B(fk2), 
	 //.clk(clk),	
	 //.rst(rst),
    .Multi(mb2)
    );

Reg_n # (size)
	Reg_fk1(
    .In(fk), 
    .rst(rst), 
    .clk(clk), 
    .EN(EN), 
    .Out(fk1)
    );

Reg_n # (size)
	Reg_fk2(
    .In(fk1), 
    .rst(rst), 
    .clk(clk), 
    .EN(EN), 
    .Out(fk2)
    );
	 
Reg_n # (size)
	Reg_yk(
    .In(yk), 
    .rst(rst), 
    .clk(clk), 
    .EN(EN), 
    .Out(y)
    );

endmodule
