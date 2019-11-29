function R = f_MTH(alpha, beta, gamma, A1, A2, A3)

R = [ cosd(alpha)*cosd(beta) cosd(alpha)*sind(beta)*sind(gamma)-sind(alpha)*...
    cosd(gamma) cosd(alpha)*sind(beta)*cosd(gamma) + sind(alpha)*sind(gamma) A1;
    sind(alpha)*cosd(beta) sind(alpha)*sind(beta)*sind(gamma) + cosd(alpha)*cosd(gamma) ...
    sind(alpha)*sind(beta)*cosd(gamma) - cosd(alpha)*sind(gamma) A2 ; -sind(beta) cosd(beta)*...
    sind(gamma) cosd(beta)*cosd(gamma) A3; 0 0 0 1];
end  
   