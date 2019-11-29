Dim = 10; %Dimensão da barra
[V1, V2] = barra(Dim);
Vt = V1;
Vt2 = V2;
for Anz = 0 : 10 : 360;
Rotz=[cosd(Anz) -sind(Anz) 0; sind(Anz) cosd(Anz) 0; 0 0 1];
V1 = Rotz*Vt;
V2 = Rotz*Vt2;
[O] = desenhabarra(V1,V2); % Função para Desenhar a barra
grid on
axis equal
axis([-15 15 -15 15 -15 15])
pause(0.01)
end