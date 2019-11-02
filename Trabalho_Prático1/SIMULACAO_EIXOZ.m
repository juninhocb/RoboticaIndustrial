clear
clc

vtt1 = [53.8688 87.5027 93.6414 118.7702 132.0329 325.0213 155.9602 168.9220 9.8018 203.7659 215.5494 233.1654 267.2895 290.2378 325.3130];
vtt2 = [87.8396 85.7870 70.9365 83.1102 86.2637 290.5583 96.3690 98.2511 264.9843 91.6645 91.2880 78.0470 71.2292 71.6263 81.9936];
t3 = 0;
vtt4 = [120.1243 105.6499 97.8496 74.2057 57.7921 293.2354 30.0968 23.7881 345.7024 43.0549 41.8386 71.9594 98.1646 108.7315 120.6752];
vtt5 = [64.7701 91.2703 272.9937 116.5764 126.8267 317.1898 142.5351 159.8407 205.0235 25.7977 226.2017 57.1782 87.3326 109.4863 137.9213];
vtt6 = [68.0450 86.3987 271.0132 77.4988  64.0242 51.8610 40.9859 30.5196 339.0192 307.2993 53.0113 287.3086 270.6331 270.7962 290.5652];
vtt7 = [67.2970 77.7096 280.8410 109.5765 117.9757 119.5368 118.6840 105.1357 247.8658 252.1131 58.7178 245.2687 259.3835 269.8863 287.4800];
                                                                                                                                                  
vtw1 = [192.0605 203.1823 216.8055 229.4487 241.6974 267.3184 289.3614 317.4855 35.9749 70.9521 92.7147 289.9776 141.1462 154.8334 168.8172];
vtw2 = [260.4191 263.3089 267.4008 271.8455 276.7980 288.8806 288.6542 292.5250 286.8524 288.6568 289.0503 44.9281 278.8975 273.4185 261.3825];
w3 = 0;
vtw4 = [338.2814 332.4267 319.0131 305.7424 288.2426 261.9225 251.5005 239.8259 239.9732 251.2406 261.6953 118.7072 301.7095 310.7808 336.8197];
vtw5 = [202.6043 217.6762 228.5211 237.2435 244.5813 87.3618 109.1140 138.1867 218.7261 251.0338 272.5917 108.5242 309.5692 328.5200 158.8322];
vtw6 = [328.1659 322.4029 305.7882 293.9130 282.1282 89.5353 90.9056 81.1634 76.2399 89.1259 89.3319 84.6130 54.6319 49.4886 328.6052];
vtw7 = [249.8684 239.2498 237.9229 239.6416 248.2029 79.2131 91.4453 93.6640 75.9433 89.9167 100.8169 105.4926 121.8056 113.4982 289.0502];

vPdx = [-281.9 -229.8 -150 -52.1 52.1 150 229.8 281.9 285.3 229.8 150 -52.1 -150 -229.8 -285.3];
vPdy = [-102.6 -192.8 -259.8 -295.4 -295.4 -259.8 -192.8 -102.6 92.7 192.8 259.8 295.4 259.8 192.8 92.7];
Pdz = 20;

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
    Pdx = vPdx(1,i);

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
    line([Ox Ax],[Oy Ay],[Oz Az],'LineWidth',3, 'color', 'black')
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
    line([Ox2 Ax2],[Oy2 Ay2],[Oz2 Az2],'LineWidth',3,'color', 'black')
    line([Ax2 Bx2],[Ay2 By2],[Az2 Bz2],'LineWidth',3,'color', 'black')
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
