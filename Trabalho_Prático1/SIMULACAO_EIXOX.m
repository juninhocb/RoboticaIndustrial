clear
clc

vtt1 = [178.8535 148.1380 130.0154 125.6390 301.8261 133.2841 322.8419 168.2716 195.9434 223.1840 229.4554 233.6959 240.8706 230.4862 211.5678];
vtt2 = [73.1758 72.1809 70.6624 85.2049 332.5513 39.9887 11.7824 143.9227 127.9797 14.7500 48.2752 72.3841 75.7384 71.7759 71.9550];
t3 = 0;
vtt4 = [117.4589 111.4434 98.8635 64.5814 236.2587 91.3679 216.7945 192.3041 213.3178 108.4797 87.6438 73.7900 78.7336 97.8143 111.3443];
vtt5 = [357.9270 328.1552 310.1929 120.7316 119.9660 121.7700 128.2374 192.7478 342.6250 52.5279 238.2805 237.6798 63.3065 50.9509 31.5348];
vtt6 = [259.9141 266.7537 277.7524 70.5286 284.2819 58.8843 305.9353 245.9979 107.6642 306.7193 62.6656 69.8153 282.1126 276.5993 267.4704];
vtt7 = [270.2844 268.0478 277.8183 115.8763 293.7331 129.5816 308.1988 95.4334 262.0678 230.8993 52.4306 61.9891 247.3543 261.9347 271.7194];
                                                                                                                                                  
vtw1 = [180.1712 211.2771 230.7795 235.0987 233.0020 226.7237 209.5020 8.0842 163.0742 141.1740 130.4919 120.9930 119.6376 129.2360 148.2398];
vtw2 = [287.0375 288.5056 288.0878 274.8325 296.2950 319.8843 221.6428 103.6342 229.3389 220.0216 308.0130 298.3627 285.6472 288.9903 287.0331];
w3 = 0;
vtw4 = [242.4610 248.3063 262.7611 295.4675 281.7658 268.5682 145.8368 266.5066 149.1296 142.3301 273.7883 273.3377 279.5523 261.8716 248.7609];
vtw5 = [0.2777 30.3606 51.3012 239.2675 239.3205 237.8249 331.9152 170.5297 16.7282 39.5457 121.2665 297.7125 297.1782 309.6342 328.1165];
vtw6 = [100.1905 92.1705 82.8573 287.5790 291.7773 300.7469 260.5287 282.5325 253.5315 268.1819 292.7492 73.9824 77.0886 83.1046 95.1143];
vtw7 = [90.5012 89.2693 83.1466 245.1364 237.9807 230.9823 85.9023 91.8786 94.7363 92.8994 304.0304 117.0817 114.7632 98.1153 85.8871];

Pdx = 0;
vPdy = [0 -100 -200 -300 -275.1 -217 -132.7 -32.4 71.8 167.3 242.7 288.7 300 200 100];
vPdz = [20 20 20 20 121.4 208.2 269.8 298.9 292 249.8 177.5 83.8 20 20 20];

% TAMANHO DE CADA PARTE DO MANIPULADORES
l1 = 166;
l2 = 251.5;
l3 = 265;
l4 = 136;
a0 = 325;
a1 = 30;
a2 = 40.5;
a3 = 27;
a4 = -325;


for i = 1:1:15
    t1 = vtt1(1,i);
    t2 = vtt2(1,i);
    t4 = vtt4(1,i);
    t5 = vtt5(1,i);
    t6 = vtt6(1,i);
    t7 = vtt7(1,i);
    
    w1 = vtw1(1,i);
    w2 = vtw2(1,i);
    w4 = vtw4(1,i);
    w5 = vtw5(1,i);
    w6 = vtw6(1,i);
    w7 = vtw7(1,i);
    
    Pdy = vPdy(1,i);
    Pdz = vPdz(1,i);

    % PLOTANDO SEMI ESFERA
    [x,y,z] = sphere;
    x = x(11:end,:);
    y = y(11:end,:);
    z = z(11:end,:);
    r = 300;
    surf(r.*x,r.*y,r.*z,'FaceColor','none');
    
    Ox = -a0;
    Oy = 0;
    Oz = 0;

    Ax = - a0 - a1*cos((pi*t1)/180);
    Ay = -a1*sin((pi*t1)/180);
    Az = l1;

    Bx = a1*cos((pi*t1)/180)*cos((pi*t2)/180) - a1*cos((pi*t1)/180) - a0; 
    By = a1*cos((pi*t2)/180)*sin((pi*t1)/180) - a1*sin((pi*t1)/180);
    Bz = l1 + a1*sin((pi*t2)/180);

    Cx = a1*cos((pi*t1)/180)*cos((pi*t2)/180) - a1*cos((pi*t1)/180) - a0 - l2*cos((pi*t1)/180)*sin((pi*t2)/180) - a2*sin((pi*t1)/180)*sin((pi*t3)/180) + a2*cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180);
    Cy = a1*cos((pi*t2)/180)*sin((pi*t1)/180) - a1*sin((pi*t1)/180) + a2*cos((pi*t1)/180)*sin((pi*t3)/180) - l2*sin((pi*t1)/180)*sin((pi*t2)/180) + a2*cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180);
    Cz = l1 + l2*cos((pi*t2)/180) + a1*sin((pi*t2)/180) + a2*cos((pi*t3)/180)*sin((pi*t2)/180);

    Dx = a2*cos((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) - a1*cos((pi*t1)/180) - a0 + a1*cos((pi*t1)/180)*cos((pi*t2)/180) - l2*cos((pi*t1)/180)*sin((pi*t2)/180) - a2*sin((pi*t1)/180)*sin((pi*t3)/180) + a2*cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180) + a2*cos((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180);
    Dy = a1*cos((pi*t2)/180)*sin((pi*t1)/180) - a2*cos((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) - a1*sin((pi*t1)/180) + a2*cos((pi*t1)/180)*sin((pi*t3)/180) - l2*sin((pi*t1)/180)*sin((pi*t2)/180) + a2*cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180) + a2*sin((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180);
    Dz = l1 + l2*cos((pi*t2)/180) + a1*sin((pi*t2)/180) + a2*cos((pi*t3)/180)*sin((pi*t2)/180) - a2*cos((pi*t2)/180)*sin((pi*t4)/180) - a2*cos((pi*t3)/180)*cos((pi*t4)/180)*sin((pi*t2)/180);

    Ex = l3*(sin((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) - cos((pi*t1)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) - a0 - a1*cos((pi*t1)/180) + a2*cos((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) - a3*sin((pi*t5)/180)*(cos((pi*t3)/180)*sin((pi*t1)/180) + cos((pi*t1)/180)*cos((pi*t2)/180)*sin((pi*t3)/180)) - a3*cos((pi*t5)/180)*(cos((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) + cos((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + a1*cos((pi*t1)/180)*cos((pi*t2)/180) - l2*cos((pi*t1)/180)*sin((pi*t2)/180) - a2*sin((pi*t1)/180)*sin((pi*t3)/180) + a2*cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180) + a2*cos((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180);
    Ey = a3*sin((pi*t5)/180)*(cos((pi*t1)/180)*cos((pi*t3)/180) - cos((pi*t2)/180)*sin((pi*t1)/180)*sin((pi*t3)/180)) - a1*sin((pi*t1)/180) - a2*cos((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) - l3*(sin((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) + cos((pi*t4)/180)*sin((pi*t1)/180)*sin((pi*t2)/180)) + a3*cos((pi*t5)/180)*(cos((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) - sin((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + a1*cos((pi*t2)/180)*sin((pi*t1)/180) + a2*cos((pi*t1)/180)*sin((pi*t3)/180) - l2*sin((pi*t1)/180)*sin((pi*t2)/180) + a2*cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180) + a2*sin((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180);
    Ez = l1 + l2*cos((pi*t2)/180) + a1*sin((pi*t2)/180) + l3*(cos((pi*t2)/180)*cos((pi*t4)/180) - cos((pi*t3)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + a3*cos((pi*t5)/180)*(cos((pi*t2)/180)*sin((pi*t4)/180) + cos((pi*t3)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) + a2*cos((pi*t3)/180)*sin((pi*t2)/180) - a2*cos((pi*t2)/180)*sin((pi*t4)/180) - a2*cos((pi*t3)/180)*cos((pi*t4)/180)*sin((pi*t2)/180) - a3*sin((pi*t2)/180)*sin((pi*t3)/180)*sin((pi*t5)/180);

    Fx = l3*(sin((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) - cos((pi*t1)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) - a0 - a1*cos((pi*t1)/180) + a2*cos((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) - a3*sin((pi*t5)/180)*(cos((pi*t3)/180)*sin((pi*t1)/180) + cos((pi*t1)/180)*cos((pi*t2)/180)*sin((pi*t3)/180)) - a3*cos((pi*t5)/180)*(cos((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) + cos((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) - a3*sin((pi*t6)/180)*(sin((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) - cos((pi*t1)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) + a3*cos((pi*t6)/180)*(cos((pi*t5)/180)*(cos((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) + cos((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + sin((pi*t5)/180)*(cos((pi*t3)/180)*sin((pi*t1)/180) + cos((pi*t1)/180)*cos((pi*t2)/180)*sin((pi*t3)/180))) + a1*cos((pi*t1)/180)*cos((pi*t2)/180) - l2*cos((pi*t1)/180)*sin((pi*t2)/180) - a2*sin((pi*t1)/180)*sin((pi*t3)/180) + a2*cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180) + a2*cos((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180);
    Fy = a3*sin((pi*t5)/180)*(cos((pi*t1)/180)*cos((pi*t3)/180) - cos((pi*t2)/180)*sin((pi*t1)/180)*sin((pi*t3)/180)) - a1*sin((pi*t1)/180) - a2*cos((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) - l3*(sin((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) + cos((pi*t4)/180)*sin((pi*t1)/180)*sin((pi*t2)/180)) + a3*cos((pi*t5)/180)*(cos((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) - sin((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + a3*sin((pi*t6)/180)*(sin((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) + cos((pi*t4)/180)*sin((pi*t1)/180)*sin((pi*t2)/180)) - a3*cos((pi*t6)/180)*(cos((pi*t5)/180)*(cos((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) - sin((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + sin((pi*t5)/180)*(cos((pi*t1)/180)*cos((pi*t3)/180) - cos((pi*t2)/180)*sin((pi*t1)/180)*sin((pi*t3)/180))) + a1*cos((pi*t2)/180)*sin((pi*t1)/180) + a2*cos((pi*t1)/180)*sin((pi*t3)/180) - l2*sin((pi*t1)/180)*sin((pi*t2)/180) + a2*cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180) + a2*sin((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180);
    Fz = l1 + l2*cos((pi*t2)/180) + a1*sin((pi*t2)/180) + l3*(cos((pi*t2)/180)*cos((pi*t4)/180) - cos((pi*t3)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + a3*cos((pi*t5)/180)*(cos((pi*t2)/180)*sin((pi*t4)/180) + cos((pi*t3)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) - a3*sin((pi*t6)/180)*(cos((pi*t2)/180)*cos((pi*t4)/180) - cos((pi*t3)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) - a3*cos((pi*t6)/180)*(cos((pi*t5)/180)*(cos((pi*t2)/180)*sin((pi*t4)/180) + cos((pi*t3)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) - sin((pi*t2)/180)*sin((pi*t3)/180)*sin((pi*t5)/180)) + a2*cos((pi*t3)/180)*sin((pi*t2)/180) - a2*cos((pi*t2)/180)*sin((pi*t4)/180) - a2*cos((pi*t3)/180)*cos((pi*t4)/180)*sin((pi*t2)/180) - a3*sin((pi*t2)/180)*sin((pi*t3)/180)*sin((pi*t5)/180);

    Gfx = l3*(sin((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) - cos((pi*t1)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) - a0 - a1*cos((pi*t1)/180) + l4*(cos((pi*t6)/180)*(sin((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) - cos((pi*t1)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) + sin((pi*t6)/180)*(cos((pi*t5)/180)*(cos((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) + cos((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + sin((pi*t5)/180)*(cos((pi*t3)/180)*sin((pi*t1)/180) + cos((pi*t1)/180)*cos((pi*t2)/180)*sin((pi*t3)/180)))) + a2*cos((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) - a3*sin((pi*t5)/180)*(cos((pi*t3)/180)*sin((pi*t1)/180) + cos((pi*t1)/180)*cos((pi*t2)/180)*sin((pi*t3)/180)) - a3*cos((pi*t5)/180)*(cos((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) + cos((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) - a3*sin((pi*t6)/180)*(sin((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) - cos((pi*t1)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) + a3*cos((pi*t6)/180)*(cos((pi*t5)/180)*(cos((pi*t4)/180)*(sin((pi*t1)/180)*sin((pi*t3)/180) - cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180)) + cos((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + sin((pi*t5)/180)*(cos((pi*t3)/180)*sin((pi*t1)/180) + cos((pi*t1)/180)*cos((pi*t2)/180)*sin((pi*t3)/180))) + a1*cos((pi*t1)/180)*cos((pi*t2)/180) - l2*cos((pi*t1)/180)*sin((pi*t2)/180) - a2*sin((pi*t1)/180)*sin((pi*t3)/180) + a2*cos((pi*t1)/180)*cos((pi*t2)/180)*cos((pi*t3)/180) + a2*cos((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180);
    Gfy = a3*sin((pi*t5)/180)*(cos((pi*t1)/180)*cos((pi*t3)/180) - cos((pi*t2)/180)*sin((pi*t1)/180)*sin((pi*t3)/180)) - a1*sin((pi*t1)/180) - l4*(cos((pi*t6)/180)*(sin((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) + cos((pi*t4)/180)*sin((pi*t1)/180)*sin((pi*t2)/180)) + sin((pi*t6)/180)*(cos((pi*t5)/180)*(cos((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) - sin((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + sin((pi*t5)/180)*(cos((pi*t1)/180)*cos((pi*t3)/180) - cos((pi*t2)/180)*sin((pi*t1)/180)*sin((pi*t3)/180)))) - a2*cos((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) - l3*(sin((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) + cos((pi*t4)/180)*sin((pi*t1)/180)*sin((pi*t2)/180)) + a3*cos((pi*t5)/180)*(cos((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) - sin((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + a3*sin((pi*t6)/180)*(sin((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) + cos((pi*t4)/180)*sin((pi*t1)/180)*sin((pi*t2)/180)) - a3*cos((pi*t6)/180)*(cos((pi*t5)/180)*(cos((pi*t4)/180)*(cos((pi*t1)/180)*sin((pi*t3)/180) + cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180)) - sin((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + sin((pi*t5)/180)*(cos((pi*t1)/180)*cos((pi*t3)/180) - cos((pi*t2)/180)*sin((pi*t1)/180)*sin((pi*t3)/180))) + a1*cos((pi*t2)/180)*sin((pi*t1)/180) + a2*cos((pi*t1)/180)*sin((pi*t3)/180) - l2*sin((pi*t1)/180)*sin((pi*t2)/180) + a2*cos((pi*t2)/180)*cos((pi*t3)/180)*sin((pi*t1)/180) + a2*sin((pi*t1)/180)*sin((pi*t2)/180)*sin((pi*t4)/180);
    Gfz = l1 - l4*(sin((pi*t6)/180)*(cos((pi*t5)/180)*(cos((pi*t2)/180)*sin((pi*t4)/180) + cos((pi*t3)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) - sin((pi*t2)/180)*sin((pi*t3)/180)*sin((pi*t5)/180)) - cos((pi*t6)/180)*(cos((pi*t2)/180)*cos((pi*t4)/180) - cos((pi*t3)/180)*sin((pi*t2)/180)*sin((pi*t4)/180))) + l2*cos((pi*t2)/180) + a1*sin((pi*t2)/180) + l3*(cos((pi*t2)/180)*cos((pi*t4)/180) - cos((pi*t3)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) + a3*cos((pi*t5)/180)*(cos((pi*t2)/180)*sin((pi*t4)/180) + cos((pi*t3)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) - a3*sin((pi*t6)/180)*(cos((pi*t2)/180)*cos((pi*t4)/180) - cos((pi*t3)/180)*sin((pi*t2)/180)*sin((pi*t4)/180)) - a3*cos((pi*t6)/180)*(cos((pi*t5)/180)*(cos((pi*t2)/180)*sin((pi*t4)/180) + cos((pi*t3)/180)*cos((pi*t4)/180)*sin((pi*t2)/180)) - sin((pi*t2)/180)*sin((pi*t3)/180)*sin((pi*t5)/180)) + a2*cos((pi*t3)/180)*sin((pi*t2)/180) - a2*cos((pi*t2)/180)*sin((pi*t4)/180) - a2*cos((pi*t3)/180)*cos((pi*t4)/180)*sin((pi*t2)/180) - a3*sin((pi*t2)/180)*sin((pi*t3)/180)*sin((pi*t5)/180);
    
    Ox2 = -a4;
    Oy2= 0;
    Oz2 = 0;

    Ax2 = a1*cos((pi*w1)/180) - a4;
    Ay2 = a1*sin((pi*w1)/180);
    Az2 = l1;

    Bx2 = a1*cos((pi*w1)/180) - a4 - a1*cos((pi*w1)/180)*cos((pi*w2)/180); 
    By2 = a1*sin((pi*w1)/180) - a1*cos((pi*w2)/180)*sin((pi*w1)/180);
    Bz2 = l1 - a1*sin((pi*w2)/180);

    Cx2 = a1*cos((pi*w1)/180) - a4 - a1*cos((pi*w1)/180)*cos((pi*w2)/180) - l2*cos((pi*w1)/180)*sin((pi*w2)/180) + a2*sin((pi*w1)/180)*sin((pi*w3)/180) - a2*cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180);
    Cy2 = a1*sin((pi*w1)/180) - a1*cos((pi*w2)/180)*sin((pi*w1)/180) - a2*cos((pi*w1)/180)*sin((pi*w3)/180) - l2*sin((pi*w1)/180)*sin((pi*w2)/180) - a2*cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180);
    Cz2 = l1 + l2*cos((pi*w2)/180) - a1*sin((pi*w2)/180) - a2*cos((pi*w3)/180)*sin((pi*w2)/180);

    Dx2 = a1*cos((pi*w1)/180) - a4 - a2*cos((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) - a1*cos((pi*w1)/180)*cos((pi*w2)/180) - l2*cos((pi*w1)/180)*sin((pi*w2)/180) + a2*sin((pi*w1)/180)*sin((pi*w3)/180) - a2*cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180) - a2*cos((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180);
    Dy2 = a1*sin((pi*w1)/180) + a2*cos((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) - a1*cos((pi*w2)/180)*sin((pi*w1)/180) - a2*cos((pi*w1)/180)*sin((pi*w3)/180) - l2*sin((pi*w1)/180)*sin((pi*w2)/180) - a2*cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180) - a2*sin((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180);
    Dz2 = l1 + l2*cos((pi*w2)/180) - a1*sin((pi*w2)/180) - a2*cos((pi*w3)/180)*sin((pi*w2)/180) + a2*cos((pi*w2)/180)*sin((pi*w4)/180) + a2*cos((pi*w3)/180)*cos((pi*w4)/180)*sin((pi*w2)/180);

    Ex2 = l3*(sin((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) - cos((pi*w1)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) - a4 + a1*cos((pi*w1)/180) - a2*cos((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) + a3*sin((pi*w5)/180)*(cos((pi*w3)/180)*sin((pi*w1)/180) + cos((pi*w1)/180)*cos((pi*w2)/180)*sin((pi*w3)/180)) + a3*cos((pi*w5)/180)*(cos((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) + cos((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) - a1*cos((pi*w1)/180)*cos((pi*w2)/180) - l2*cos((pi*w1)/180)*sin((pi*w2)/180) + a2*sin((pi*w1)/180)*sin((pi*w3)/180) - a2*cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180) - a2*cos((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180);
    Ey2 = a1*sin((pi*w1)/180) - l3*(sin((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) + cos((pi*w4)/180)*sin((pi*w1)/180)*sin((pi*w2)/180)) + a2*cos((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) - a3*sin((pi*w5)/180)*(cos((pi*w1)/180)*cos((pi*w3)/180) - cos((pi*w2)/180)*sin((pi*w1)/180)*sin((pi*w3)/180)) - a3*cos((pi*w5)/180)*(cos((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) - sin((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) - a1*cos((pi*w2)/180)*sin((pi*w1)/180) - a2*cos((pi*w1)/180)*sin((pi*w3)/180) - l2*sin((pi*w1)/180)*sin((pi*w2)/180) - a2*cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180) - a2*sin((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180);
    Ez2 = l1 + l2*cos((pi*w2)/180) - a1*sin((pi*w2)/180) + l3*(cos((pi*w2)/180)*cos((pi*w4)/180) - cos((pi*w3)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) - a3*cos((pi*w5)/180)*(cos((pi*w2)/180)*sin((pi*w4)/180) + cos((pi*w3)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) - a2*cos((pi*w3)/180)*sin((pi*w2)/180) + a2*cos((pi*w2)/180)*sin((pi*w4)/180) + a2*cos((pi*w3)/180)*cos((pi*w4)/180)*sin((pi*w2)/180) + a3*sin((pi*w2)/180)*sin((pi*w3)/180)*sin((pi*w5)/180);

    Fx2 = l3*(sin((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) - cos((pi*w1)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) - a4 + a1*cos((pi*w1)/180) - a2*cos((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) + a3*sin((pi*w5)/180)*(cos((pi*w3)/180)*sin((pi*w1)/180) + cos((pi*w1)/180)*cos((pi*w2)/180)*sin((pi*w3)/180)) + a3*cos((pi*w5)/180)*(cos((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) + cos((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) + a3*sin((pi*w6)/180)*(sin((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) - cos((pi*w1)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) - a1*cos((pi*w1)/180)*cos((pi*w2)/180) - a3*cos((pi*w6)/180)*(cos((pi*w5)/180)*(cos((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) + cos((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) + sin((pi*w5)/180)*(cos((pi*w3)/180)*sin((pi*w1)/180) + cos((pi*w1)/180)*cos((pi*w2)/180)*sin((pi*w3)/180))) - l2*cos((pi*w1)/180)*sin((pi*w2)/180) + a2*sin((pi*w1)/180)*sin((pi*w3)/180) - a2*cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180) - a2*cos((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180);
    Fy2 = a1*sin((pi*w1)/180) - l3*(sin((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) + cos((pi*w4)/180)*sin((pi*w1)/180)*sin((pi*w2)/180)) + a2*cos((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) - a3*sin((pi*w5)/180)*(cos((pi*w1)/180)*cos((pi*w3)/180) - cos((pi*w2)/180)*sin((pi*w1)/180)*sin((pi*w3)/180)) - a3*cos((pi*w5)/180)*(cos((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) - sin((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) - a3*sin((pi*w6)/180)*(sin((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) + cos((pi*w4)/180)*sin((pi*w1)/180)*sin((pi*w2)/180)) - a1*cos((pi*w2)/180)*sin((pi*w1)/180) - a2*cos((pi*w1)/180)*sin((pi*w3)/180) + a3*cos((pi*w6)/180)*(cos((pi*w5)/180)*(cos((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) - sin((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) + sin((pi*w5)/180)*(cos((pi*w1)/180)*cos((pi*w3)/180) - cos((pi*w2)/180)*sin((pi*w1)/180)*sin((pi*w3)/180))) - l2*sin((pi*w1)/180)*sin((pi*w2)/180) - a2*cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180) - a2*sin((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180);
    Fz2 = l1 + l2*cos((pi*w2)/180) - a1*sin((pi*w2)/180) + l3*(cos((pi*w2)/180)*cos((pi*w4)/180) - cos((pi*w3)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) - a3*cos((pi*w5)/180)*(cos((pi*w2)/180)*sin((pi*w4)/180) + cos((pi*w3)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) + a3*sin((pi*w6)/180)*(cos((pi*w2)/180)*cos((pi*w4)/180) - cos((pi*w3)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) + a3*cos((pi*w6)/180)*(cos((pi*w5)/180)*(cos((pi*w2)/180)*sin((pi*w4)/180) + cos((pi*w3)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) - sin((pi*w2)/180)*sin((pi*w3)/180)*sin((pi*w5)/180)) - a2*cos((pi*w3)/180)*sin((pi*w2)/180) + a2*cos((pi*w2)/180)*sin((pi*w4)/180) + a2*cos((pi*w3)/180)*cos((pi*w4)/180)*sin((pi*w2)/180) + a3*sin((pi*w2)/180)*sin((pi*w3)/180)*sin((pi*w5)/180);

    Gfx2 = l3*(sin((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) - cos((pi*w1)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) - a4 + a1*cos((pi*w1)/180) + l4*(cos((pi*w6)/180)*(sin((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) - cos((pi*w1)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) + sin((pi*w6)/180)*(cos((pi*w5)/180)*(cos((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) + cos((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) + sin((pi*w5)/180)*(cos((pi*w3)/180)*sin((pi*w1)/180) + cos((pi*w1)/180)*cos((pi*w2)/180)*sin((pi*w3)/180)))) - a2*cos((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) + a3*sin((pi*w5)/180)*(cos((pi*w3)/180)*sin((pi*w1)/180) + cos((pi*w1)/180)*cos((pi*w2)/180)*sin((pi*w3)/180)) + a3*cos((pi*w5)/180)*(cos((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) + cos((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) + a3*sin((pi*w6)/180)*(sin((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) - cos((pi*w1)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) - a1*cos((pi*w1)/180)*cos((pi*w2)/180) - a3*cos((pi*w6)/180)*(cos((pi*w5)/180)*(cos((pi*w4)/180)*(sin((pi*w1)/180)*sin((pi*w3)/180) - cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180)) + cos((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) + sin((pi*w5)/180)*(cos((pi*w3)/180)*sin((pi*w1)/180) + cos((pi*w1)/180)*cos((pi*w2)/180)*sin((pi*w3)/180))) - l2*cos((pi*w1)/180)*sin((pi*w2)/180) + a2*sin((pi*w1)/180)*sin((pi*w3)/180) - a2*cos((pi*w1)/180)*cos((pi*w2)/180)*cos((pi*w3)/180) - a2*cos((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180);
    Gfy2 = a1*sin((pi*w1)/180) - l3*(sin((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) + cos((pi*w4)/180)*sin((pi*w1)/180)*sin((pi*w2)/180)) - l4*(cos((pi*w6)/180)*(sin((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) + cos((pi*w4)/180)*sin((pi*w1)/180)*sin((pi*w2)/180)) + sin((pi*w6)/180)*(cos((pi*w5)/180)*(cos((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) - sin((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) + sin((pi*w5)/180)*(cos((pi*w1)/180)*cos((pi*w3)/180) - cos((pi*w2)/180)*sin((pi*w1)/180)*sin((pi*w3)/180)))) + a2*cos((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) - a3*sin((pi*w5)/180)*(cos((pi*w1)/180)*cos((pi*w3)/180) - cos((pi*w2)/180)*sin((pi*w1)/180)*sin((pi*w3)/180)) - a3*cos((pi*w5)/180)*(cos((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) - sin((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) - a3*sin((pi*w6)/180)*(sin((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) + cos((pi*w4)/180)*sin((pi*w1)/180)*sin((pi*w2)/180)) - a1*cos((pi*w2)/180)*sin((pi*w1)/180) - a2*cos((pi*w1)/180)*sin((pi*w3)/180) + a3*cos((pi*w6)/180)*(cos((pi*w5)/180)*(cos((pi*w4)/180)*(cos((pi*w1)/180)*sin((pi*w3)/180) + cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180)) - sin((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) + sin((pi*w5)/180)*(cos((pi*w1)/180)*cos((pi*w3)/180) - cos((pi*w2)/180)*sin((pi*w1)/180)*sin((pi*w3)/180))) - l2*sin((pi*w1)/180)*sin((pi*w2)/180) - a2*cos((pi*w2)/180)*cos((pi*w3)/180)*sin((pi*w1)/180) - a2*sin((pi*w1)/180)*sin((pi*w2)/180)*sin((pi*w4)/180);
    Gfz2 = l1 + l2*cos((pi*w2)/180) - a1*sin((pi*w2)/180) - l4*(sin((pi*w6)/180)*(cos((pi*w5)/180)*(cos((pi*w2)/180)*sin((pi*w4)/180) + cos((pi*w3)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) - sin((pi*w2)/180)*sin((pi*w3)/180)*sin((pi*w5)/180)) - cos((pi*w6)/180)*(cos((pi*w2)/180)*cos((pi*w4)/180) - cos((pi*w3)/180)*sin((pi*w2)/180)*sin((pi*w4)/180))) + l3*(cos((pi*w2)/180)*cos((pi*w4)/180) - cos((pi*w3)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) - a3*cos((pi*w5)/180)*(cos((pi*w2)/180)*sin((pi*w4)/180) + cos((pi*w3)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) + a3*sin((pi*w6)/180)*(cos((pi*w2)/180)*cos((pi*w4)/180) - cos((pi*w3)/180)*sin((pi*w2)/180)*sin((pi*w4)/180)) + a3*cos((pi*w6)/180)*(cos((pi*w5)/180)*(cos((pi*w2)/180)*sin((pi*w4)/180) + cos((pi*w3)/180)*cos((pi*w4)/180)*sin((pi*w2)/180)) - sin((pi*w2)/180)*sin((pi*w3)/180)*sin((pi*w5)/180)) - a2*cos((pi*w3)/180)*sin((pi*w2)/180) + a2*cos((pi*w2)/180)*sin((pi*w4)/180) + a2*cos((pi*w3)/180)*cos((pi*w4)/180)*sin((pi*w2)/180) + a3*sin((pi*w2)/180)*sin((pi*w3)/180)*sin((pi*w5)/180);

    % PLOTANDO PONTOS BRAÇO 1
    line([Ox Ax],[Oy Ay],[Oz Az],'LineWidth',3,'color', 'black')
    line([Ax Bx],[Ay By],[Az Bz],'LineWidth',3,'color', 'black')
    line([Bx Cx],[By Cy],[Bz Cz],'LineWidth',3,'color', 'black')
    line([Cx Dx],[Cy Dy],[Cz Dz],'LineWidth',3,'color', 'black')
    line([Dx Ex],[Dy Ey],[Dz Ez],'LineWidth',3,'color', 'black')
    line([Ex Fx],[Ey Fy],[Ez Fz],'LineWidth',3,'color', 'black')
    line([Fx Gfx],[Fy Gfy],[Fz Gfz],'LineWidth',3,'color', 'black')

    hold on
    plot3([Ox],[Oy],[Oz],'ro')
    plot3([Ox],[Oy],[Oz],'rx')
    plot3([Ox],[Oy],[Oz],'r+')

    plot3([Ax],[Ay],[Az],'ro')
    plot3([Ax],[Ay],[Az],'rx')
    plot3([Ax],[Ay],[Az],'r+')

    plot3([Bx],[By],[Bz],'ro')
    plot3([Bx],[By],[Bz],'rx')
    plot3([Bx],[By],[Bz],'r+')

    plot3([Cx],[Cy],[Cz],'ro')
    plot3([Cx],[Cy],[Cz],'rx')
    plot3([Cx],[Cy],[Cz],'r+')

    plot3([Dx],[Dy],[Dz],'ro')
    plot3([Dx],[Dy],[Dz],'rx')
    plot3([Dx],[Dy],[Dz],'r+')

    plot3([Ex],[Ey],[Ez],'ro')
    plot3([Ex],[Ey],[Ez],'rx')
    plot3([Ex],[Ey],[Ez],'r+')

    plot3([Fx],[Fy],[Fz],'ro')
    plot3([Fx],[Fy],[Fz],'rx')
    plot3([Fx],[Fy],[Fz],'r+')

    plot3([Gfx],[Gfy],[Gfz],'ro')
    plot3([Gfx],[Gfy],[Gfz],'rx')
    plot3([Gfx],[Gfy],[Gfz],'r+')

    % PLOTANDO BRAÇO 2
    line([Ox2 Ax2],[Oy2 Ay2],[Oz2 Az2],'LineWidth',3, 'color', 'black')
    line([Ax2 Bx2],[Ay2 By2],[Az2 Bz2],'LineWidth',3,'color', 'black' )
    line([Bx2 Cx2],[By2 Cy2],[Bz2 Cz2],'LineWidth',3,'color', 'black')
    line([Cx2 Dx2],[Cy2 Dy2],[Cz2 Dz2],'LineWidth',3,'color', 'black')
    line([Dx2 Ex2],[Dy2 Ey2],[Dz2 Ez2],'LineWidth',3,'color', 'black')
    line([Ex2 Fx2],[Ey2 Fy2],[Ez2 Fz2],'LineWidth',3,'color', 'black')
    line([Fx2 Gfx2],[Fy2 Gfy2],[Fz2 Gfz2],'LineWidth',3,'color', 'black')

    plot3([Ox2],[Oy2],[Oz2],'ro')
    plot3([Ox2],[Oy2],[Oz2],'rx')
    plot3([Ox2],[Oy2],[Oz2],'r+')

    plot3([Ax2],[Ay2],[Az2],'ro')
    plot3([Ax2],[Ay2],[Az2],'rx')
    plot3([Ax2],[Ay2],[Az2],'r+')

    plot3([Bx2],[By2],[Bz2],'ro')
    plot3([Bx2],[By2],[Bz2],'rx')
    plot3([Bx2],[By2],[Bz2],'r+')

    plot3([Cx2],[Cy2],[Cz2],'ro')
    plot3([Cx2],[Cy2],[Cz2],'rx')
    plot3([Cx2],[Cy2],[Cz2],'r+')

    plot3([Dx2],[Dy2],[Dz2],'ro')
    plot3([Dx2],[Dy2],[Dz2],'rx')
    plot3([Dx2],[Dy2],[Dz2],'r+')

    plot3([Ex2],[Ey2],[Ez2],'ro')
    plot3([Ex2],[Ey2],[Ez2],'rx')
    plot3([Ex2],[Ey2],[Ez2],'r+')

    plot3([Fx2],[Fy2],[Fz2],'ro')
    plot3([Fx2],[Fy2],[Fz2],'rx')
    plot3([Fx2],[Fy2],[Fz2],'r+')

    plot3([Gfx2],[Gfy2],[Gfz2],'ro')
    plot3([Gfx2],[Gfy2],[Gfz2],'rx')
    plot3([Gfx2],[Gfy2],[Gfz2],'r+')
    
    % PLOTANDO CAIXA
    PlotCube([100 40 40],[Pdx-50 Pdy-20 Pdz-20],.8,[1 1 0]);
    
    pause(0.25);
    
    xlabel('X AXIS');
    ylabel('Y AXIS');
    zlabel('Z AXIS');

    grid on
    
    
end
