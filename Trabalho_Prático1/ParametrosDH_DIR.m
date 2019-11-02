% Multipliação de Matrizes de D-H 

theta1 = 0; 
theta2 = 0;
theta3 = 0;
theta4 = 0;
theta5 = 0;
theta6 = 0;
theta7 = 0;

T0 = [1 0 0 325; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T1 = [cosd(theta1) 0 sind(theta1) 30*cosd(theta1); sind(theta1) 0 -cosd(theta1) 30*sind(theta1)...
    ; 0 1 0 166 ; 0 0 0 1];
T2 = [cosd(theta2) 0 -sind(theta2) -30*cosd(theta2); sind(theta2) 0 cosd(theta2) -30*sind(theta2)...
    ; 0 -1 0 0; 0 0 0 1];
T3 = [cosd(theta3) 0 sind(theta3) -40.5*cosd(theta3); sind(theta3) 0 -cosd(theta3) -40.5*sind(theta3)...
    ; 0 1 0 251.5; 0 0 0 1];
T4 = [cosd(theta4) 0 -sind(theta4) 40.5*cosd(theta4); sind(theta4) 0 cosd(theta4) 40.5*sind(theta4)...
    ; 0 -1 0 0; 0 0 0 1];
T5 = [cosd(theta5) 0 sind(theta5) -27*cosd(theta5); sind(theta5) 0 -cosd(theta5) -27*sind(theta5)...
    ; 0 1 0 265; 0 0 0 1];
T6 = [cosd(theta6) 0 -sind(theta6) 27*cosd(theta6); sind(theta6) 0 cosd(theta6) 27*sind(theta6)...
    ; 0 -1 0 0; 0 0 0 1];
T7 = [cosd(theta7) -sind(theta7) 0 0; sind(theta7) cosd(theta7) 0 0 ...
    ; 0 0 1 136; 0 0 0 1];

T = T0*T1*T2*T3*T4*T5*T6*T7