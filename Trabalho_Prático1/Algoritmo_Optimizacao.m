%%
% Algortimo para otimização 

clear 
clc

% Localização do Bloco

Pdx = 300;
Pdy = 0;
Pdz = 20;

VTR = 1.e-10;
D = 6;                          %Numero de variaveis a otimizar 
XVmin = [0 0 0 0 0 0];            %no constituyen los limites de busqueda del resultado,  
XVmax = [360 360 360 360 360 360];              %solo permiten identificar una poblacion inicial
y=[Pdx Pdy Pdz];
NP = 100*D; 
strategy = 7;
refresh = 100; 
itermax = 20000;  % Número de Iterações
F = 0.8; 
CR = 0.5; 

[bestmem,bestval,nfeval] = devec3('FuncionObjetivo',VTR,D,XVmin,XVmax,y,NP,itermax,F,CR,strategy,refresh)

t1 = bestmem(1);
t2 = bestmem(2);
t3 = 0;                   %Lembrar redundancia
t4 = bestmem(3);
t5 = bestmem(4);
t6 = bestmem(5);
t7 = bestmem(6);

[bestmem,bestval,nfeval] = devec3('FuncionObjetivo2',VTR,D,XVmin,XVmax,y,NP,itermax,F,CR,strategy,refresh)

w1 = bestmem(1);
w2 = bestmem(2);
w3 = 0;
w4 = bestmem(3);
w5 = bestmem(4);
w6 = bestmem(5);
w7 = bestmem(6);


