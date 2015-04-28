function [ y ] = PA200( Entrada )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Programa en Matlab que ejecuta un filtro de orden 2 paso alto
% Con frceuencia de corte igual 200Hz
% Se asume que los datos de entrada de encuentra en el arreglo Entrada
% Y la sal ida se asume que se almacena en el arreglo y

fNMenos1 = 0;
fNMenos2 = 0;

a1 = -1.96;
a2 = 0.9605;
b0 = 1;
b1 = -2;
b2 = 1;
n = length ( Entrada ) ;
y = [] ;
for i =1:1:n
f = Entrada ( i ) -a1*fNMenos1 -a2*fNMenos2 ;
y ( i ) = b0* f + b1*fNMenos1 +b2*fNMenos2 ;
fNMenos2 = fNMenos1 ;
fNMenos1 = f;
end

end

