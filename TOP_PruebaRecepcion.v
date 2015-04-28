`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:18:03 04/08/2015 
// Design Name: 
// Module Name:    TOP_PruebaRecepcion 
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
module TOP_PruebaRecepcion(
    input clk,
    input rst,
    input Data_in,
    output [7:0] catodos,
    output [3:0] anodos,
	 output [3:0]Zeros,
	 output CS
    );
	 
wire [11:0]Dato;
wire listo;
wire [11:0]datoL;	 
CapturaMensaje Captura(
	 .clk(clk),
	 .rst(rst),
	 .data_in(Data_in),
	 .Listo(listo),
	 .CS(CS),
	 .Zeros(Zeros),
	 .Dato(Dato)
    );

Registro DatoL(
    .dato_in(Dato),
	 .EN(listo),
    .rst(rst),
    .clk(clk),
    .dato_out(datoL)
    );

ComprobacionSSegmentos segmentos(
    .dato_in(datoL),
	 .clk(clk),
	 .rst(rst),
    .anodo(anodos),
    .catodo(catodos)
    );

endmodule
