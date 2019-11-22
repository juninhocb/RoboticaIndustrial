%% Representação do Robo SCARA em MATLAB 

%% Utilizando a biblioteca de Peter Corke.

% Instânciando as juntas
L1 = Link('d', 10, 'a', 0, 'alpha', 0)
L1.isrevolute
L1.A(0.2)

%L2 = Link([0,0,1,0,1]);
%L2.isprismatic
%L2.qlim = [0,0];
L2 = Link('d', 7, 'a', 0, 'alpha', 0)
L2.isrevolute
L2.A(0.2)


L3 = Link('d', 0, 'a', 5, 'alpha', 0)
L3.isrevolute
L3.A(0.2)

L4 = Link('d', -15, 'a', 0, 'alpha', 0)
L4.isrevolute

robo = SerialLink([L1 L2 L3 L4], 'name', 'SCARA')

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


theta = zeros(1,4);  
tempo = 0:1:10;
theta_atual = zeros(1,4);

for t = 1:0.5:2
    
    theta(1,2) = a10 + a11*t + a12*(t.^2) + a13*(t.^3);
    theta(1,3) = a20 + a21*t + a22*(t.^2) + a23*(t.^3);
    theta(1,4) = a30 + a31*t + a32*(t.^2) + a33*(t.^3);
    
    q = jtraj(theta_atual, theta, tempo);
    robo.plot(q, 'trail', '-')
  
    pause(1)
    hold on 
    
    
    theta_atual = theta; 

end

