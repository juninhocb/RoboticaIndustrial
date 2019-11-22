function [O] = desenhabarra(V1,V2)

X = V1(1,:);
Y = V1(2,:);
Z = V1(3,:);
X2 = V2(1,:);
Y2 = V2(2,:);
Z2 = V2(3,:);

r = 110;
g = 123;
b = 255;
fill3(X, Y, Z, [r/255 g/255 b/255]);
hold on
fill3(X2, Y2, Z2, [r/255 g/255 b/255]);

L = length(X);
for i = 1 : (L-1)
    p1 = [X2(i) Y2(i) Z2(i)];
    p2 = [X2(i+1) Y2(i+1) Z2(i+1)];
    p3 = [X(i+1) Y(i+1) Z(i+1)];
    p4 = [X(i) Y(i) Z(i)]; 

    x = [p1(1) p2(1) p3(1) p4(1)];
    y = [p1(2) p2(2) p3(2) p4(2)];
    z = [p1(3) p2(3) p3(3) p4(3)];

    fill3(x, y, z, [r/255 g/255 b/255]);
end
hold off
O = 0;