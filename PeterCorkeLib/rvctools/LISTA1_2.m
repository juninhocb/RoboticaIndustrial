% parâmetros de D-H 

d1 = 1;
d2 = 1; 
d3 = 1;
l = 1;

dh = [0 d1 0 -90; 0 d2+l d3 0] 


R = SerialLink(dh)

q = [0 0] 

R.plot(q);

%R.Teach;

% Jacobiano 

J0 = R.jacob0(q);
