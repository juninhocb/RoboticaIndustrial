%% LIMITE DO ROBÔ 

THETA1_MAX = deg2rad(200);
THETA1_MIN = deg2rad(0);
THETA2_MAX = deg2rad(135);
THETA2_MIN = deg2rad(0);
D3_MAX = 0.200;
D3_MIN = 0;
THETA4_MAX = deg2rad(180);
THETA4_MIN = deg2rad(-180);

%% AREA DE TRABALHO DO ROBÔ

MIN_SCARA = 0.28;
MAX_SCARA = 0.65; 
MIN_USER = 0.25; 
MAX_USER = 0.5; 

%% TAMANHOS ROBÔ

a1 = 0.400;  
a2 = 0.250;
d1 = 0.250;
d4 = 0.050;

%% DEFINIÇÃO DAS JUNTAS 

L0 = link([0 0 0 d1 0], 'standard');
L1 = link([pi a1 0 0 0], 'standard');
L2 = link([0 a2 0 0 0], 'standard');
L3 = link([0 0 0 0 1], 'standard');
L4 = link([0 0 0 d4 0], 'standard');

%% 

global KEY_IS_PRESSED

KEY_IS_PRESSED = 0; 
gcf
set(gcf, 'KeyPressFcn', @myKeyPressFcn)

%% DEFINÇÃO DO ROBÔ

scara = robot({L0 L1 L2 L3 L4});
scara.name = 'SCARA';

%% APRESENTAÇÃO

hold on; 
grid on;
view([-37.5 30])
axis([-1 1 -1 1 0 0.3]);
xlabel('x');
ylabel('y');
zlabel('z');

time = 0; 

while ~KEY_IS_PRESSED
    
    x = deg2rad(time);
    time = time + 1;
    
    px = 0.4*sin(x);
    py = 0.4;
    pz = abs(0.2*sin(x));
    
    % CINEMÁTICA INVERSA
    theta2 = acos((px^2 + py^2 -a1^2 -a2^2)/(2*a1*a2));
    beta = atan(py/px);
    if beta < 0
        beta = beta + pi;
    end
    phi = acos((px^2 + py^2 + a1^2 - a2^2)/(2*sqrt(px^2+py^2)*a1));
    theta1 = beta + phi;
    
    if theta1 > THETA1_MAX
        theta1 = THETA1_MAX;
    elseif theta1 < THETA1_MIN
        theta1 = THETA1_MIN;
    end
    
    if theta2 > THETA2_MAX
        theta2 = THETA2_MAX;
    elseif theta2 < THETA2_MIN
        theta2 = THETA2_MIN;
    end
     
    d3 = pz; 
    if d3 > D3_MAX
        d3 = D3_MAX;
    elseif d3 < D3_MIN
        d3 = D3_MIN
    end
    
    plot(scara, [0 theta1 theta2 d3 0]);
    plot3(px,py,(0.3-pz-d4), 'o', 'LineWidth',2, 'Color', 'red');
    
    pause(0.01);
end

disp ('loop ended')
    
    
    
    



