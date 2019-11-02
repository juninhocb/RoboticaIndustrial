% Programmed by: Leonardo Mejia Rincon
% UFSC 2019
% ***********************************************************************
% This function create a planar link on the plane X-Y
% having as main parameters the Origin, The final poit, The aberture,
% The Radius, the  Thicket and the resolution of the circular portion of the joint
% 
% Or = [10 0 0];
% Fn = [10 10 0];
% Ab = 60;    %Abertura do angulo do elo
% Rd = 1;     %Raio da junta
% Es = 1;     %Espesura da parede do elo
% Rs = 20;     %Resolução da divisão
% [V1,V2] = planarlink(Or, Fn, Ab, Rd, Es, Rs);
% hold on
% Or = [10 10 0]; %Origem
% Fn = [15 15 0]; %Fim
% Ab = 60;    %Abertura do angulo do elo
% Rd = 1;     %Raio da junta
% Es = 1;     %Espesura da parede do elo
% Rs = 20;     %Resolução da divisão
% [V1,V2] = planarlink(Or, Fn, Ab, Rd, Es, Rs);
% hold off
%

 function [V1,V2] = planarlink(Or, Fn, Ab, Rd, Es, Rs)

X = [];
Y = [];
Z = [];

An = rad2deg(atan2((Fn(2)-Or(2)),(Fn(1)-Or(1))));


for i = (Ab/2 + An) : ((360 - Ab)/Rs) : (360 - (Ab/2) + An)
    X = [X  Or(1) + Rd*cos(deg2rad(i))];
    Y = [Y  Or(2) + Rd*sin(deg2rad(i))];
    Z = [Z  Es/2];
end

for i = (180 + Ab/2 + An) : (360 - Ab)/ Rs : (540 - Ab/2 + An)
    X = [X  Fn(1) + Rd*cos(deg2rad(i))];
    Y = [Y  Fn(2) + Rd*sin(deg2rad(i))];
    Z = [Z  Es/2];
end

X = [X X(1)];
Y = [Y Y(1)];
Z = [Z Z(1)];
Z = Z + Or(3);

X2 = X;
Y2 = Y;
Z2 = Z - Es;

V1 = [X; Y; Z];
V2 = [X2; Y2; Z2];
