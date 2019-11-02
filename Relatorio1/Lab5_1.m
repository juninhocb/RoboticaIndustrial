clf
clear all
clc

%% Criando partes sólidas do robô
Din1 = 9;
Din2 = 6;
Din3 = 4;
teta1= 10;
teta2 = 55;

[V1, V2] = barra(Din1);
[V3, V4] = barra(Din2);
[V5, V6] = barra(Din3);

grid on
axis equal
%% Completando os vetores V com 1 na última linha
[A B] = size(V1);
V1 = [V1; ones(1,B)];

[A B] = size(V2);
V2 = [V2; ones(1,B)];

[A B] = size(V3);
V3 = [V3; ones(1,B)];

[A B] = size(V4);
V4 = [V4; ones(1,B)];

[A B] = size(V5);
V5 = [V5; ones(1,B)];

[A B] = size(V6);
V6 = [V6; ones(1,B)];

%%

Vt1 = V1;
Vt2 = V2;
Vt3 = V3;
Vt4 = V4;
Vt5 = V5;
Vt6 = V6;


 Rotz= f_MTH(10, 0, 0, 0, 0, 0);
    
 for a = 1:43;
         V1(:, a) = Rotz*Vt1(:, a);
         V2(:, a) = Rotz*Vt2(:, a);
         V3(:, a) = Rotz*Vt3(:, a);
         V4(:, a) = Rotz*Vt4(:, a);
         V5(:, a) = Rotz*Vt5(:, a);
         V6(:, a) = Rotz*Vt6(:, a);
  end
 %Para rotação de teta2, a gente translada as duas barras para origem e
 %%depois translada de volta
 
 Vt1 = V1;
 Vt2 = V2;
 Vt3 = V3;
 Vt4 = V4;
 Vt5 = V5;
 Vt6 = V6;
 
 

Rotz= f_MTH(45, 0, 0, 0, 0, 0);
   
for a = 1:43;
        V3(:, a) = Rotz*Vt3(:, a);
        V4(:, a) = Rotz*Vt4(:, a);
        V5(:, a) = Rotz*Vt5(:, a);
        V6(:, a) = Rotz*Vt6(:, a);
 end
%Para rotação de teta2, a gente translada as duas barras para origem e
%%depois translada de volta

Vt3 = V3;
Vt4 = V4;
Vt5 = V5;
Vt6 = V6;

 % Transladando a segunda barra para o fim da primeira
 Rotz = f_MTH(0, 0, 0, 9*cosd(teta1), 9*sind(teta1) ,0);
 for a = 1:43;
     V3(:,a) = Rotz*Vt3(:, a);
     V4(:,a) = Rotz*Vt4(:, a);
 end
 [L] = desenhabarra(V3,V4); % Função para Desenhar a barra
 
 hold on

Rotz= f_MTH(30, 0, 0, 0, 0, 0);
   
for a = 1:43;
        V5(:, a) = Rotz*Vt5(:, a);
        V6(:, a) = Rotz*Vt6(:, a);
 end
%Para rotação de teta2, a gente translada as duas barras para origem e
%%depois translada de volta

Vt5 = V5;
Vt6 = V6;

 % Transladando a terceira barra para o fim da segunda
     Rotz = f_MTH(0, 0, 0, 21.5*cosd(teta2), 8*sind(teta2), 0);
     for a = 1:43;
         V5(:,a) = Rotz*Vt5(:, a);
         V6(:,a) = Rotz*Vt6(:, a);
     end
     
  [E] = desenhabarra(V5,V6); % Função para Desenhar a barra
  
  hold on
  

[O] = desenhabarra(V1, V2);
hold on




 
 grid on
 axis ([-25 25 -25 25 -25 25])
 
  
 
     
   
    
    
    
    
   

