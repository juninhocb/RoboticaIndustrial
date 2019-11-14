% parâmetros de D-H 

d1 = 1;
l1 = 1; 
l2 = 1;
l3 = 1;

dh = [0 d1 0 0; 0 0 l1 0;0 0 l2 0; 0 0 l3 0]; 


R = SerialLink(dh)

q = [0 0 0 0] 

R.plot(q);

%R.Teach;

% Jacobiano 

J0 = R.jacob0(q);
