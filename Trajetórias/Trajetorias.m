t = 0:0.1:5;

%teta1

a10 = 1.63;
a11 = 0;
a12 = 0.04;
a13 = -0.00592;

y = a10 + a11*t + a12*(t.^2) + a13*(t.^3);


% teta2

a20 = 2.66;
a21 = 0;
a22 = -0.0864;
a23 = 0.01152;

y1 = a20 + a21*t + a22*(t.^2) + a23*(t.^3);

%teta3

a30 = -1.02;
a31 = 0;
a32 = 0.2292;
a33 = -0.03056;

y2 = a30 + a31*t + a32*(t.^2) + a33*(t.^3);


%apresentação dos resultados

figure(); 
plot(t,y, 'g');
hold on 
plot(t,y1, 'r');
hold on 
plot(t,y2, 'b');

title('Trajetorias ');
xlabel('Tempo(S)');
ylabel('Theta(RAD)');
legend('Theta 1 = VERDE', 'Theta 2 = VERMELHO', 'Theta 3 = AZUL');

