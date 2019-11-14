% parâmetros de D-H 

l1 = 1;
l2 = 1; 
l3 = 1;
l4 = 1;

dh = [0 0 l1 0; 0 0 l2 0;0 0 l3 0; 0 0 l4 0]; 


R = SerialLink(dh)

q = [0 0 0 0] 

R.plot(q);

%R.Teach;

% Jacobiano 

J0 = R.jacob0(q);
