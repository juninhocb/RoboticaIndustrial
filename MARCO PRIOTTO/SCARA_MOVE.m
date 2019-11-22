%% Representação do Robo SCARA em MATLAB 

%% Utilizando a biblioteca de Peter Corke.

% Instânciando as juntas
L1 = Link('d', 1, 'a', 0, 'alpha', 0)
L1.isrevolute
L1.A(0.2)

%L2 = Link([0,0,1,0,1]);
%L2.isprismatic
%L2.qlim = [0,0];
L2 = Link('d', 1, 'a', 0, 'alpha', 0)
L2.isrevolute
L2.A(0.2)


L3 = Link('d', 0, 'a', 1, 'alpha', 0)
L3.isrevolute
L3.A(0.2)

L4 = Link('d', -1, 'a', 0, 'alpha', 0)
L4.isrevolute

robo = SerialLink([L1 L2 L3 L4], 'name', 'SCARA')

qf0 = [0 0 0 0];
qf1 = [0 -pi/2 pi/2 pi/2];
qf2 = [-pi/3 -pi/2 pi/2 0];
qf3 = [-pi/3 0 pi/2 -2*pi/3];
qf4 = [-2*pi/3 0 pi/2 0];

%T0 = robo.fkine(qf0);
%T1 = robo.fkine(qf1);
%T2 = robo.fkine(qf2);
%T3 = robo.fkine(qf3);
%T4 = robo.fkine(qf4);

tempo = 0:1:10;
q = jtraj(qf0, qf1, tempo);
robo.plot(q, 'trail', '--')
pause(1)
q = jtraj(qf1, qf2, tempo);
robo.plot(q, 'trail', '--')
pause(1)
q = jtraj(qf2, qf3, tempo);
robo.plot(q, 'trail', '--')
pause(1)
q = jtraj(qf3, qf4, tempo);
robo.plot(q, 'trail', '--')
pause(1)
q = jtraj(qf4, qf1, tempo);
pause(1)
q = jtraj(qf2, qf4, tempo);










