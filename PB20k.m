function [ y ] = PB20k( Entrada )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Programa en Matlab que ejecuta un filtro de orden 2 paso bajo
% Con frecuencia de cor t e igual 20kHz
% Se asume que los datos de entrada de encuentra en el arreglo Entrada
% Y la salida se asume que se almacena en el arreglo y

fNMenos1 = 0;
fNMenos2 = 0;

a1 = 1.591;
a2 = 0.6617;
b0 = 0.8132;
b1 = 1.626;
b2 = 0.8132;
n = length ( Entrada ) ;
y = [] ;
for i =1:1:n
f = Entrada ( i ) -a1*fNMenos1 -a2*fNMenos2 ;
y ( i ) = b0* f + b1*fNMenos1 +b2*fNMenos2 ;
fNMenos2 = fNMenos1 ;
fNMenos1 = f;
end

end
