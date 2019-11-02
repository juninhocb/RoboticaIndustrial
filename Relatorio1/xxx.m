Dim = 10;
[V1 , V2] = barra(Dim);
[A B] = size(V1);
V1 = [V1 ; ones(1 , B) ];
[A B] = size(V2);
V2 = [V2 ; ones(1 , B) ];
Vt = V1;
Vt2 = V2;


for Anz = 0 : 10 : 360;
    Tran=[1 0 0 10; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    V1 = Tran*Vt;
    V2 = Tran*Vt2;
    [O] = desenhabarra(V1,V2);
    grid on
    axis equal
    axis ([-25 25 -25 25 -25 25])
    pause(0.01)
end

for Anz = 0 : 10 : 360;
    Rotz=[cosd(Anz) -sind(Anz) 0 1 ; sind(Anz) cosd(Anz) 0 1; 0 0 1 1];
    V1 = Rotz*Vt;
    V2 = Rotz*Vt2;
    [O] = desenhabarra(V1,V2);
    grid on
    axis equal
    axis ([-25 25 -25 25 -25 25])
    pause(0.01)
end

hold on
[O] = desenhabarra(V1,V2);

Dim = 7;
[V1, V2] = barra(Dim);
Vt = V1;
Vt2 = V2;

for Anz = 0 : 10 : 360;
    Rotz=[cosd(Anz) -sind(Anz) 0 1 ; sind(Anz) cosd(Anz) 0 1 ; 0 0 1 1];
    V1 = Rotz*Vt;
    V2 = Rotz*Vt2;
    [O] = desenhabarra(V1,V2);
    grid on
    axis equal
    axis ([-25 25 -25 25 -25 25])
    pause(0.01)
end

hold on
[O] = desenhabarra(V1, V2);
