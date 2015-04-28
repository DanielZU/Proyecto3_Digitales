function [ y ] = PA5k( Entrada )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Programa en Matlab que ejecuta un filtro de orden 2 paso alto
% Con frecuencia de corte igual 5kHz
% Se asume que los datos de entrada de encuentra en el arreglo Entrada
% Y la salida se asume que se almacena en el arreglo y

fNMenos1 = 0;
fNMenos2 = 0;

a1 = -1.035;
a2 = 0.3678;
b0 = 0.6007;       %parametros de cada filtro
b1 = -1.201;
b2 = 0.6007;
n = length ( Entrada ) ;    %se mide el largo de la palabra
y = [] ;     % se crea el arreglo  
for i =1:1:n     
f = Entrada ( i ) -a1*fNMenos1 -a2*fNMenos2 ;    %Los valores que se van a guardar en el registro
y ( i ) = b0* f + b1*fNMenos1 +b2*fNMenos2 ;    %funcion de salida
fNMenos2 = fNMenos1 ;       % se guarda el valor anterior en el segundo registro
fNMenos1 = f;        % se guarda el valor actual en el primer registro

end

end