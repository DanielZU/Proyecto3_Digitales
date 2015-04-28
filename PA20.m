function [ y ] = PA20( Entrada )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Programa en Matlab que ejecuta un filtro de orden 2 paso alto
% Con f rceuencia de cor t e igual 20Hz
% Se asume que los datos de entrada de encuentra en e l ar reglo Entrada
% Y la sal ida se asume que se almacena en e l ar reglo y

fNMenos1 = 0;
fNMenos2 = 0;

a1 = -1.996;
a2 = 0.996;
b0 = 0.998;
b1 = -1.996;
b2 = 0.998;
n = length ( Entrada ) ;
y = [] ;
for i =1:1:n
f = Entrada ( i ) -a1*fNMenos1 -a2*fNMenos2 ;
y ( i ) = b0* f + b1*fNMenos1 +b2*fNMenos2 ;
fNMenos2 = fNMenos1 ;
fNMenos1 = f;
%disp('REGISTRO1');
%disp(fNMenos1 );
%disp('REGISTRO2');
%disp(f);
end

end

