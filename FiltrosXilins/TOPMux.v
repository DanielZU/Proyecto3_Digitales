`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:34:49 05/02/2015 
// Design Name: 
// Module Name:    TOPMux 
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
module TOPMux#(parameter size=22)
(
    input ps2d,
    input ps2c,
    input En,
    input rst,
    input clk,
    input [21:0] A,
    input [21:0] B,
    input [21:0] C,
	 output correct,
    output [21:0] Salida
    );
wire [1:0]Cselect;
wire tick;
wire [7:0] Letra;

Prueb_Teclado PS2(
		.clk(clk),
		.rst(rst),
		.ps2d(ps2d),
		.ps2c(ps2c),
		.EN(En),
		.code(Letra),
		.Tick(tick),
		.correct(correct)
    );

ValidacionL etra(
    .dato_in(Letra),
    .Listo(tick),
    .rst(rst),
    .enable(Cselect)
    );
	 
Mux #(size) MUx1
	(
		.A(A), 
		.B(B), 
		.C(C),
		.Select(Cselect),
		.Salida(Salida)
    );

endmodule
