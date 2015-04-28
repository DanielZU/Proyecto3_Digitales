`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:06:24 04/27/2015
// Design Name:   Paso_Banda
// Module Name:   /home/daniel/Proyect3Filtros/Prueba_Filtro.v
// Project Name:  Proyect3Filtros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Paso_Banda
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Prueba_Filtro;

	// Inputs
	reg [20:0] u;
	reg clk;
	reg rst;
	reg EN;

	// Outputs
	wire [20:0] y1;
	wire [20:0] y2;
	wire [20:0] y3;

	integer k;
	reg [0:20] Datos[0:1000];
	// Instantiate the Unit Under Test (UUT)
	Paso_Banda uut (
		.u(u), 
		.clk(clk), 
		.rst(rst), 
		.EN(EN), 
		.y1(y1),
		.y2(y2),
		.y3(y3)
	);

integer z;
initial forever #20 clk=~clk;

	initial begin
		// Initialize Inputs
		u=0;
		clk=1'b0;
		rst=1'b1;
		EN=1'b0;
		repeat(10)@(posedge clk);
		rst=1'b0;
		
	end
	
	//bloque para cargar datos, pasarlos por la unidad en prueba y guardarlos
	initial begin
	//@(posedge EN);
	
	$readmemb("Rampa.txt", Datos); // se leen los datos en el .txt y se guardan en el arreglo
	z=$fopen("output.txt","w");     //se abre el archivo destino de los datos de salida
	@(negedge rst);
	for (k=1; k<1000; k=k+1)begin
		@(posedge clk);
		EN=1'b1;
		u=Datos[k];         //aqui, en el ciclo positivo se pasan los datos de entrada por la unidad a analizar
		@(posedge clk);
		EN=1'b0;	
		$fwrite(z,"%b\n",y1);   //en el ciclo negativo se guarda el resultado en el destino	
		
		
		
	end
	$fclose(z); // necesario cerrar el archivo destino
	$stop;
	end

      
endmodule

