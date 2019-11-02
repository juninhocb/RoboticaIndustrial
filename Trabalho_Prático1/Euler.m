clear all 
clc

syms phi theta psi

phi = 0;
theta = 0;
psi = 0;

[x,y,z] = sphere;
x = x(11:end,:);
y = y(11:end,:);
z = z(11:end,:);
r = 300;
surf(r.*x,r.*y,r.*z,'FaceColor','none');
hold on

for phi = 0:-20:-360
    angeuler = [cosd(phi)*cosd(theta) cosd(phi)*sind(theta)*sind(psi)-sind(phi)*cosd(psi) cosd(phi)*sind(theta)*cosd(psi)+sind(phi)*sind(psi);
        sind(phi)*cosd(theta) sind(phi)*sind(theta)*sind(psi)+cosd(phi)*cosd(psi) sind(theta)*sind(phi)*cosd(psi)-cosd(phi)*sind(psi);
        -sind(theta) cosd(theta)*sind(psi) cosd(theta)*cosd(psi)];
    posin = [300;
        0;
        20];

    A = angeuler*posin;
    Ax = A(1,1);
    Ay = A(2,1);
    Az = A(3,1);
    plot3(Ax,Ay,Az,'green*')
    plot3(Ax,Ay,Az,'greeno')
    hold on
    pause(0.25);



end
   
for theta = 0:-10:-180
    angeuler = [cosd(phi)*cosd(theta) cosd(phi)*sind(theta)*sind(psi)-sind(phi)*cosd(psi) cosd(phi)*sind(theta)*cosd(psi)+sind(phi)*sind(psi);
        sind(phi)*cosd(theta) sind(phi)*sind(theta)*sind(psi)+cosd(phi)*cosd(psi) sind(theta)*sind(phi)*cosd(psi)-cosd(phi)*sind(psi);
        -sind(theta) cosd(theta)*sind(psi) cosd(theta)*cosd(psi)];

        
    posin = [300;
        0;
        0];

    A = angeuler*posin;
    Ax = A(1,1);
    Ay = A(2,1);
    Az = A(3,1);
    plot3(Ax,Ay,Az,'red*')
    plot3(Ax,Ay,Az,'redo')
    hold on
    pause(0.25);
    grid on

end

theta = 0;

for psi = 0:10:180
    angeuler = [cosd(phi)*cosd(theta) cosd(phi)*sind(theta)*sind(psi)-sind(phi)*cosd(psi) cosd(phi)*sind(theta)*cosd(psi)+sind(phi)*sind(psi);
        sind(phi)*cosd(theta) sind(phi)*sind(theta)*sind(psi)+cosd(phi)*cosd(psi) sind(theta)*sind(phi)*cosd(psi)-cosd(phi)*sind(psi);
        -sind(theta) cosd(theta)*sind(psi) cosd(theta)*cosd(psi)];
    
    posin = [0;
        300;
        0];

    A = angeuler*posin;
    Ax = A(1,1);
    Ay = A(2,1);
    Az = A(3,1);
    plot3(Ax,Ay,Az,'blue*')
    plot3(Ax,Ay,Az,'blueo')
    hold on
    pause(0.25);
    grid on

end

grid on