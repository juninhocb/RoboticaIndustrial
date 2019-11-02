theta =sym('theta');

q0 = cos(theta/2);
q1 = sin(theta/2);
q2 = sin(theta/2);
q3 = sin(theta/2);

Q = [2*((q0^2)+(q1^2))-1,2*(q1*q2+q0*q3),2*(q1*q3-q0*q2);
    2*(q1*q2-q0*q3),2*((q0^2)+(q2^2))-1,2*(q2*q3+q0*q2);
    2*(q1*q3-q0*q2),2*(q2*q3-q0*q1),2*((q0^2)+(q3^2))-1];

% Z 
posin = [0;
    300;
    20];

for i = 0:20:360
    theta = deg2rad(i);
    q0 = cos(theta/2);
    q1 = 0;
    q2 = 0;
    q3 = sin(theta/2);
    Q = [2*((q0^2)+(q1^2))-1,2*(q1*q2+q0*q3),2*(q1*q3-q0*q2);
    2*(q1*q2-q0*q3),2*((q0^2)+(q2^2))-1,2*(q2*q3+q0*q2);
    2*(q1*q3-q0*q2),2*(q2*q3-q0*q1),2*((q0^2)+(q3^2))-1];
    A = Q*posin;
      hold on
      plot3(A(1,:),A(2,:),A(3,:),'black*');
      plot3(A(1,:),A(2,:),A(3,:),'blacko');
     hold on
end

% X
posin = [0;
    -300;
    20];


for i = 0:10:170
    theta = deg2rad(i);
    q0 = cos(theta/2);
    q1 = sin(theta/2);
    q2 = 0;
    q3 = 0;
    Q = [2*((q0^2)+(q1^2))-1,2*(q1*q2+q0*q3),2*(q1*q3-q0*q2);
    2*(q1*q2-q0*q3),2*((q0^2)+(q2^2))-1,2*(q2*q3+q0*q2);
    2*(q1*q3-q0*q2),2*(q2*q3-q0*q1),2*((q0^2)+(q3^2))-1];
    A = Q*posin;
      hold on
      plot3(A(1,:),A(2,:),A(3,:),'black*');
      plot3(A(1,:),A(2,:),A(3,:),'blacko');

     hold on
end



% Y
posin = [-300;
    0;
    20];

for i = 0:10:170
    theta = deg2rad(i);
    q0 = cos(theta/2);
    q1 = 0;
    q2 = sin(theta/2);
    q3 = 0;
    Q = [2*((q0^2)+(q1^2))-1,2*(q1*q2+q0*q3),2*(q1*q3-q0*q2);
    2*(q1*q2-q0*q3),2*((q0^2)+(q2^2))-1,2*(q2*q3+q0*q2);
    2*(q1*q3-q0*q2),2*(q2*q3-q0*q1),2*((q0^2)+(q3^2))-1];
    A = Q*posin;
      hold on
      plot3(A(1,:),A(2,:),A(3,:),'black*');
      plot3(A(1,:),A(2,:),A(3,:),'blacko');
      
      xlabel('X AXIS');
      ylabel('Y AXIS');
      zlabel('Z AXIS');
      
     grid on   
     hold on
end