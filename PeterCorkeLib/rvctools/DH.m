% parâmetros de D-H 

l1 = 2;
l2 = 2; 
l3 = 3; 

dh = [0 0 l1 0; 0 0 l2 0;0 0 l3 0]; 


R = SerialLink(dh)

q = [0 0 0] 

R.plot(q);

%R.Teach;

% Jacobiano 

J0 = R.jacob0(q);

