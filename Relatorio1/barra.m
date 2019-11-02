function [Va, Vb] = barra(Dim)

Or = [0 0 0]; %Origem
Fn = [Dim 0 0]; %Fim
Ab = 60;    %Abertura do angulo do elo
Rd = 1;     %Raio da junta
Es = 1;     %Espesura da parede do elo
Rs = 20;     %Resolução da divisão
[V1,V2] = planarlink(Or, Fn, Ab, Rd, Es, Rs);

Va = V1;
Vb = V2;
