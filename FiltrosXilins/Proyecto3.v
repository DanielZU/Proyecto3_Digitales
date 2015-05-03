`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:02 05/02/2015 
// Design Name: 
// Module Name:    Proyecto3 
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
module Proyecto3#(parameter sign=1, parameter pf=14, parameter mag=7,parameter size=sign+pf+mag)
(
    input Datoin,
	 input ps2d,
	 input ps2c,
	 input EN,
	 input rst,
    input clk,
    output [21:0] Datoout,
    output CS,
	 output correct,
	 output [3:0]zeros
    );
	 
wire signed [size-1:0] Cdato;
wire signed [size-1:0] CA;
wire signed [size-1:0] CB;
wire signed [size-1:0] CC;

Paso_Banda #(sign, pf, mag,size)
	Filtro
	(
		.u(Cdato),
		.clk(clk), 
		.rst(rst), 
		.EN(CS),
		.y1(CA),
		.y2(CB),
		.y3(CC)
    );

TOPMux #(size) SelectorS
(
    .ps2d(ps2d),
    .ps2c(ps2c),
    .En(EN),
    .rst(rst),
    .clk(clk),
    .A(CA),
    .B(CB),
    .C(CC),
	 .correct(correct),
    .Salida(Datoout)
    );
	 
TOP_PruebaRecepcion Recibir(
    .clk(clk),
    .rst(rst),
    .Data_in(Datoin),
	 .DatoOut(Cdato),
	 .Zeros(zeros),
	 .CS(CS)
    );

endmodule
