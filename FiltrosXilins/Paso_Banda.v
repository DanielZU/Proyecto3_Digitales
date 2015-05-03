`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:49 04/27/2015 
// Design Name: 
// Module Name:    Paso_Banda 
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
module Paso_Banda #(parameter sign=1, parameter pf=14, parameter mag=7,parameter size=sign+pf+mag)
	(
		input wire signed [size-1:0] u,
		input wire clk, rst, EN,
		output wire signed [size-1:0] y1,y2,y3
    );

wire signed [size-1:0] cy1,cy2,cy3;
											
localparam [size-1:0]
//bajos 
		a1_b1=22'h007D71, //0000 0111 1101 0111 0001, //1.96
		a2_b1=22'hFFC287, //1111 1100 0010 1000 0111, //-0.9605
		b0_b1=22'h000003, //0000 0000 0000 0000 0011, //0.000199
		b1_b1=22'h000007, //0000 0000 0000 0000 0111, //0.0003979
		b2_b1=22'h000003, //0000 0000 0000 0000 0011, //0.000199 

		a1_a1=22'h007FBE, //0000 0111 1111 1011 1110, //1.996
		a2_a1=22'hFFC042, //1111 1100 0000 0100 0010, //-0.996
		b0_a1=22'h003FDF, //0000 0011 1111 1101 1111, //0.998
		b1_a1=22'hFF8042, //1111 1000 0000 0100 0010, //-1.996
		b2_a1=22'h003FDF, //0000 0011 1111 1101 1111, //0.998

//Medios
		a1_b2=22'h00423D,  //0 0000 0100 0010 0011 1101,  //1.035,
		a2_b2=22'hFFE876,  //1 1111 1101 0000 1110 1100,  //-0.3678 
		b0_b2=22'h000552,  //0 0000 0000 1010 1010 0101,  //0.08316
		b1_b2=22'h000110,  //0 0000 0001 0101 0100 1001,  //0.1663
		b2_b2=22'h000552,  //0 0000 0000 1010 1010 0101,  //0.08316

		a1_a2=22'h007D71,  //0 0000 1111 1010 1110 0001,  //1.96
		a2_a2=22'hFFC287,  //1 1111 1000 0101 0000 1110,  //-0.9605
		b0_a2=22'h004000,  //0 0000 1000 0000 0000 0000,  //1
		b1_a2=22'hFF8000,  //1 1111 0000 0000 0000 0000,  //-2
		b2_a2=22'h004000,  //0 0000 1000 0000 0000 0000,  //1
//Altos

		a1_b3=22'hFF9A2D,  //1 1111 1001 1010 0010 1101,  //-1.591
		a2_b3=22'hFFD5A7,  //1 1111 1101 0101 1010 0111,  //-0.6617
		b0_b3=22'h00340B,  //0 0000 0011 0100 0000 1011,  //0.8132
		b1_b3=22'h006810,  //0 0000 0110 1000 0001 0000,  //1.626
		b2_b3=22'h00340B,  //0 0000 0011 0100 0000 1011,  //0.8132

		a1_a3=22'h00423D,  //0 0000 0100 0010 0011 1101,  //1.035
		a2_a3=22'hFFE876,  //1 1111 1110 1000 0111 0110,  //-0.3678
		b0_a3=22'h002672,  //0 0000 0010 0110 0111 0010,  //0.6007
		b1_a3=22'hFFB323,  //1 1111 1011 0011 0010 0011,  //-1.201
		b2_a3=22'h002672;  //0 0000 0010 0110 0111 0010,  //0.6007

//bajos
Filtro #(size, sign, pf, mag)
	BPaso_Bajo (
    .u(u), 
    .a1(a1_b1), 
    .a2(a2_b1), 
    .b0(b0_b1), 
    .b1(b1_b1), 
    .b2(b2_b1), 
    .clk(clk), 
    .rst(rst), 
    .EN(EN), 
    .y(cy1)
    );
	 
Filtro #(size, sign, pf, mag)
	BPaso_Alto (
    .u(cy1), 
    .a1(a1_a1), 
    .a2(a2_a1), 
    .b0(b0_a1), 
    .b1(b1_a1), 
    .b2(b2_a1), 
    .clk(clk), 
    .rst(rst), 
    .EN(EN), 
    .y(y1)
    );

//medios
Filtro #(size, sign, pf, mag)
	MPaso_Bajo (
    .u(u), 
    .a1(a1_b2), 
    .a2(a2_b2), 
    .b0(b0_b2), 
    .b1(b1_b2), 
    .b2(b2_b2), 
    .clk(clk), 
    .rst(rst), 
    .EN(EN), 
    .y(cy2)
    );
	 
Filtro #(size, sign, pf, mag)
	MPaso_Alto (
    .u(cy2), 
    .a1(a1_a2), 
    .a2(a2_a2), 
    .b0(b0_a2), 
    .b1(b1_a2), 
    .b2(b2_a2), 
    .clk(clk), 
    .rst(rst), 
    .EN(EN), 
    .y(y2)
    );
	 
//alto
Filtro #(size, sign, pf, mag)
	APaso_Bajo (
    .u(u), 
    .a1(a1_b3), 
    .a2(a2_b3), 
    .b0(b0_b3), 
    .b1(b1_b3), 
    .b2(b2_b3), 
    .clk(clk), 
    .rst(rst), 
    .EN(EN), 
    .y(cy3)
    );
	 
Filtro #(size, sign, pf, mag)
	APaso_Alto (
    .u(cy3), 
    .a1(a1_a3), 
    .a2(a2_a3), 
    .b0(b0_a3), 
    .b1(b1_a3), 
    .b2(b2_a3), 
    .clk(clk), 
    .rst(rst), 
    .EN(EN), 
    .y(y3)
    );
endmodule
