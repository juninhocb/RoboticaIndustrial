 % Transladando a segunda barra para o fim da primeira
 Rotz = f_MTH(0, 0, 0, -9*cosd(teta1), 0 ,0);
 for a = 1:43;
     V3(:,a) = Rotz*Vt3(:, a);
     V4(:,a) = Rotz*Vt4(:, a);
 end
 [L] = desenhabarra(V3,V4); % Função para Desenhar a barra
 
 hold on
 
     
     % Transladando a terceira barra para o fim da segunda
     Rotz = f_MTH(0, 0, 0, -15*cosd(teta1),0, 0);
     for a = 1:43;
         V5(:,a) = Rotz*Vt5(:, a);
         V6(:,a) = Rotz*Vt6(:, a);
     end
     
  [E] = desenhabarra(V5,V6); % Função para Desenhar a barra
  
  hold on
  
 Vt1 = V1;
 Vt2 = V2;
 Vt3 = V3;
 Vt4 = V4;
 Vt5 = V5;
 Vt6 = V6;

 for Anz = 0 : 10 : 90;
     Rotz= f_MTH(Anz, 0, 0, 0, 0, 0);
     
     for a = 1:43;
         V3(:, a) = Rotz*Vt3(:, a);
         V4(:, a) = Rotz*Vt4(:, a);
         V5(:, a) = Rotz*Vt5(:, a);
         V6(:, a) = Rotz*Vt6(:, a);
     end
    
     [O] = desenhabarra(V1,V2); % Função para Desenhar a barra
     [L] = desenhabarra(V3, V4); % Função para Desenhar a barra
     [E] = desenhabarra(V5,V6); % Função para Desenhar a barra    
     hold on
     grid on
     axis equal
     axis ([-25 25 -25 25 -5 5])
     pause(0.01)
 end
 
 Vt1 = V1;
 Vt2 = V2;
 Vt3 = V3;
 Vt4 = V4;
 Vt5 = V5;
 Vt6 = V6;
 
    
 % Transladando a segunda barra para o fim da primeira
 Rotz = f_MTH(0, 0, 0, 9*cosd(teta1) ,0 ,0);
 for a = 1:43;
     V3(:,a) = Rotz*Vt3(:, a);
     V4(:,a) = Rotz*Vt4(:, a);
 end
 
 
 
 Vt1 = V1;
 Vt2 = V2;
 Vt3 = V3;
 Vt4 = V4;
 Vt5 = V5;
 Vt6 = V6;    
      
    % Transladando a terceira barra para o fim da segunda
     Rotz = f_MTH(0, 0, 0, 15*cosd(teta1), 0, 0);
     for a = 1:43;
         V5(:,a) = Rotz*Vt5(:, a);
         V6(:,a) = Rotz*Vt6(:, a);
     end
     
 [L] = desenhabarra(V3, V4); % Função para Desenhar a barra
 
  hold on
 
 [E] = desenhabarra(V5,V6); % Função para Desenhar a barra    
     
  hold on
 
 Vt1 = V1;
 Vt2 = V2;
 Vt3 = V3;
 Vt4 = V4;
 Vt5 = V5;
 Vt6 = V6;    
     
     
     
     
     
 [O] = desenhabarra(V1, V2);
% Transladando a segunda barra para o fim da primeira
 Rotz = f_MTH(0, 0, 0, 9 ,0 ,0);
 for a = 1:43;
     V3(:,a) = Rotz*Vt3(:, a);
     V4(:,a) = Rotz*Vt4(:, a);
 end
  hold on
  
 [L] = desenhabarra(V3,V4); % Função para Desenhar a barra
 
  hold on 
 
     % Transladando a terceira barra para o fim da segunda
     Rotz = f_MTH(0, 0, 0, 15, 0, 0);
     for a = 1:43;
         V5(:,a) = Rotz*Vt5(:, a);
         V6(:,a) = Rotz*Vt6(:, a);
     end
  [E] = desenhabarra(V5,V6); % Função para Desenhar a barra
     
   hold on   
  
 % Atualizamos os valores temporários para a rotação de teta 1
 
 Vt1 = V1;
 Vt2 = V2;
 Vt3 = V3;
 Vt4 = V4;
 Vt5 = V5;
 Vt6 = V6;