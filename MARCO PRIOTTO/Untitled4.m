%q0=[0 0 0 0 0 0 0];
%q1b=[3*pi .1745 pi/3 pi/2 .5236 pi/1.5 0];
%q1=[.0873 .1745 .3491 .1745 .5236 .8727 0];
%q2=[.0873 0 -.3491 .2618 .8727 1.2217 0];
%q3=[-.1745 -.3491  .5236 .0873 -.1222 .3491 0];
%q4=[.1745 .1745 0 -.1396 .3191 -.5236 0];
%q5=[-.3491 -.3491 -.3491 0 -.0873 0 0];

q0=[0 1.0053 0 0.94247 0 1.0053 0];
q1b=[pi/2 1.0053 0 0.94247 0 1.0053 0];
q1=[pi 1.0053 0 0.94247 0 1.0053 0];
q2=[pi 0.62831 0 1.5708 0 0.94249 0];
q3=[pi/2 0.62831 0 1.5708 0 0.94249 0];
q4=[0 0.62831 0 1.5708 0 0.94249 0];

%Iniciar Rbt
L1=Link([0 12.4 0 pi/2 0 -pi/2]);
L2=Link([0 0 0 -pi/2 ]);
L3=Link([0 15.43 0 pi/2 ]);
L4=Link([0 0 0 -pi/2 0 0]);
L5=Link([0 15.925 0 pi/2]);
L6=Link([0 0 0 -pi/2 ]);
L7=Link([0 15.0 0 0 0 pi/2]);

LinkMat=[0 12.4 0 pi/2 0 -pi/2;
    0 0 0 -pi/2 0 0;
    0 15.43 0 pi/2 0 0;
    0 0 0 -pi/2 0 0;
    0 15.925 0 pi/2 0 0;
    0 0 0 -pi/2 0 0;
    0 15 0 0 0 pi/2];
Rbt=SerialLink([L1 L2 L3 L4 L5 L6 L7], 'name', 'jeffersa');
Rbt2=SerialLink([L1 L2 L3 L4 L5]);
Rbt3=SerialLink(LinkMat);
t=0:.03:2;%Time vector & steps

traj1=jtraj(q0,q1,t); 
traj2=jtraj(q1,q2,t);
traj3=jtraj(q2,q3,t);
traj4=jtraj(q3,q4,t);
traj5=jtraj(q4,q1,t);
%traj6=jtraj(q5,q0,t);

traj1=jtraj(qsq1,qsq2,t); 
traj2=jtraj(qsq2,qsq3,t);
traj3=jtraj(qsq3,qsq4,t);
traj4=jtraj(qsq4,qsq5,t);
traj5=jtraj(qsq5,qsq6,t);
traj6=jtraj(qsq6,qsq1,t);

Rbt.plot(traj1, 'trail', '--')
Rbt.plot(traj2, 'trail', '--')
Rbt.plot(traj3, 'trail', '--')
Rbt.plot(traj4, 'trail', '--')
Rbt.plot(traj5, 'trail', '--')


%qsq1=[0.46088 0.37699 0 1.31 0 1.4451 0];
%qsq2=[.81681 0.56549 0 1.0681 0 1.2566 0 ];
%qsq3=[2.36 0.69115 0 0.848 0 1.4451 0 ];
%qsq4=[2.66 0.37699 0 1.31 0 1.4451 0];
% qsq5=[pi/2 0.62831 0 1.5708 0 0.94249 0];
% qsq6=[0 0.62831 0 1.5708 0 0.94249 0];

t=0:.04:2;
sqtraj1=jtraj(q0,qsq1,t); 
sqtraj2=jtraj(qsq1,qsq2,t); 
sqtraj3=jtraj(qsq2,qsq3,t); 
sqtraj4=jtraj(qsq3,qsq4,t);
sqtraj5=jtraj(qsq4,qsq1,t);
sqtraj6=jtraj(qsq1,q0,t);
% sqtraj7=jtraj(qsq6,q0,t);

hold on
atj=zeros(4,4);
view(-35,40)
xlim([-40,40])
ylim([-40,40])
zlim([0,60])


