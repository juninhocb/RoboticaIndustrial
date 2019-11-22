%% Representação do Robo SCARA em MATLAB 

%% Utilizando a biblioteca de Peter Corke.

% Instânciando as juntas

%L2 = Link([0,0,1,0,1]);
%L2.isprismatic
%L2.qlim = [0,0];
L2 = Link('d', 10 ,'a', 0, 'alpha', 0)
L2.isrevolute
L2.A(0.2)

L3 = Link('d', 0, 'a', 7, 'alpha', 0)
L3.isrevolute
L3.A(0.2)

L4 = Link('d',-5 , 'a', 0, 'alpha', 0)
L4.isrevolute

robo = SerialLink([L2 L3 L4], 'name', 'ROBO DO MEJIA')

%t = 0:0.1:5;

%teta1

a10 = 1.63;
a11 = 0;
a12 = 0.04;
a13 = -0.00592;

%y0 = [0 0 0 0]; 
%y = a10 + a11*t + a12*(t.^2) + a13*(t.^3);


% teta2

a20 = 2.66;
a21 = 0;
a22 = -0.0864;
a23 = 0.01152;

%y1 = a20 + a21*t + a22*(t.^2) + a23*(t.^3);

%teta3

a30 = -1.02;
a31 = 0;
a32 = 0.2292;
a33 = -0.03056;

%y2 = a30 + a31*t + a32*(t.^2) + a33*(t.^3);


theta = zeros(1,3);  
tempo = 0:2:2;
theta_atual = zeros(1,3);

% theta(t) = a10


%theta(1,1) = 2; 
%theta(1,2) = 2; 
%theta(1,3) = 2;

%q = jtraj([0 0 0], theta, tempo);
%robo.plot(q, 'trail', '--')

%theta(1,1) = 4; 
%theta(1,2) = 4; 
%theta(1,3) = 4;

q1 = jtraj([0 0 0], [0 2 0], tempo);
robo.plot(q1, 'trail', '--', 'top', 'delay', 1)
q2 = jtraj([0 2 0], [0 4 0], tempo);
robo.plot(q2, 'trail', '--', 'top','delay', 1)
q3 = jtraj([0 4 0], [0 -8 0], tempo);
robo.plot(q3, 'trail', '--', 'top', 'delay', 1)










%t = 1;    
%theta(1,1) = a10 + a11*t + a12*(t.^2) + a13*(t.^3);
%theta(1,2) = a20 + a21*t + a22*(t.^2) + a23*(t.^3);
%theta(1,3) = a30 + a31*t + a32*(t.^2) + a33*(t.^3);
%q = jtraj(theta_atual, theta, tempo);
%robo.plot(q, 'trail', '-')
  
%pause(1)
%hold on 
    
%theta_atual = theta; 


