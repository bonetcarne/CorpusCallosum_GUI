function [dist,u] = calcula_distancia(A,B,C)
% Los puntos A y B forman la recta y se calcula la distancia dle ptoC a la
% recta

Ar = B(2)-A(2);
Br = A(1)-B(1);
Cr = A(2)*B(1) - A(1)*B(2);

dist = abs(Ar*C(1)+Br*C(2)+Cr) / (sqrt(Ar^2+Br^2));

u = [B(1)-A(1),B(2)-A(2)]/sqrt((B(1)-A(1))^2+(B(2)-A(2))^2);

end