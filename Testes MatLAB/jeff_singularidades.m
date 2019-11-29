


syms q1 q2 q3 L1 L2 L3

%L1 = 0.3;
%L2 = 0.3;
%L3 = 0.15;

a = -sin(q1)*(L3*cos(q2)+L2)-cos(q1)*L3*sin(q2);
b = -(sin(q2)*L3*sin(q1+90))+(cos(q2)*L3*cos(q1+90));
c = -sin(q1)*(L3*cos(q2)+L2)-cos(q1)*L3*sin(q2);
d = -(sin(q2)*L3*sin(q1+90))+(cos(q2)*L3*cos(q1+90));

J = [a b 0 1 ;...
    c  d 0  1;...
    0 0 -1  1;];

J' eh o j transposto
