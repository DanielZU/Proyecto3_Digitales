function [ y ] = PB5k( Entrada )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Programa en Matlab que ejecuta un f i l t r o de orden 2 paso bajo
% Con f rceuencia de cor t e igual 200Hz
% Se asume que los datos de entrada de encuentra en e l ar reglo Entrada
% Y la sal ida se asume que se almacena en e l ar reglo y

fNMenos1 = 0;
fNMenos2 = 0;

a1 = -1.035;
a2 = 0.3678;
b0 = 0.08316;
b1 = 0.1663;
b2 = 0.08316;
n = length ( Entrada ) ;
y = [] ;
for i =1:1:n
f = Entrada ( i ) -a1*fNMenos1 -a2*fNMenos2 ;
y ( i ) = b0* f + b1*fNMenos1 +b2*fNMenos2 ;
fNMenos2 = fNMenos1 ;
fNMenos1 = f;
end


end
