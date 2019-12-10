function lines = hofer_div(points, pos)


    % dividimos el cuerpo cayoso
    % dividir el segmento en una razon dada 
    % x = (x2+rx1)/(1+r); y= (y2+ry1)/(1+r); donde si queremos la tercera
    % parte r= 1/2. si queremos la mitad r=1, si queremos la quinta parte
    % r=1/4

    
    % LineaI esta a 1/6 de la parte frontal del CC ->r=1/5
     lineaI = zeros(2,2);
     
     %Los puntos de las líneas se darán siguiendo el formato:
     % primer punto es el que coincide con la recta del rectangulo marcada
     % por la posicion
     
     if pos == 1
         
        lineaI (1,1) = (points(1,1)+1/5*points(2,1))/(1+1/5); %posicion X del punto en un lado del rectangulo
        lineaI (1,2) = (points(1,2)+1/5*points(2,2))/(1+1/5); %posicion Y del punto en un lado del rectangulo
        lineaI (2,1) = (points(4,1)+1/5*points(3,1))/(1+1/5); %posicion X del punto el otro lado del rectangulo
        lineaI (2,2) = (points(4,2)+1/5*points(3,2))/(1+1/5); %posicion Y del punto el otro la
     
     else
        lineaI (1,1) = (points(4,1)+1/5*points(3,1))/(1+1/5); %posicion X del punto en un lado del rectangulo
        lineaI (1,2) = (points(4,2)+1/5*points(3,2))/(1+1/5); %posicion Y del punto en un lado del rectangulo
        lineaI (2,1) = (points(1,1)+1/5*points(2,1))/(1+1/5); %posicion X del punto el otro lado del rectangulo
        lineaI (2,2) = (points(1,2)+1/5*points(2,2))/(1+1/5); %posicion Y del punto el otro la
     
     end
     
%      [xi,yi] = polyxpoly(lineaI(:,1),lineaI(:,2),length_line_points(:,1),length_line_points(:,2));
%    
%        if pos==1
%            lineaI_plot = [lineaI(1,:);xi,yi];
%        else
%            lineaI_plot = [lineaI(2,:);xi,yi];
%        end
       
    % línea delimita zona II esta a 1/2 del CC ->r=1
    lineaII = zeros (2,2);
       
    if pos==1
        lineaII (1,1) = (points(1,1)+points(2,1))/2; 
        lineaII (1,2) = (points(1,2)+points(2,2))/2; 
        lineaII (2,1) = (points(4,1)+points(3,1))/2; 
        lineaII (2,2) = (points(4,2)+points(3,2))/2;
    else 
        lineaII (1,1) = (points(4,1)+points(3,1))/2; 
        lineaII (1,2) = (points(4,2)+points(3,2))/2; 
        lineaII (2,1) = (points(1,1)+points(2,1))/2; 
        lineaII (2,2) = (points(1,2)+points(2,2))/2;
    end
    % línea delimita zona III 1/3 de la parte trasera del CC -> r=1/2
    lineaIII = zeros(2,2);
    
    if pos == 1
        lineaIII (1,1) = (points(2,1)+1/2*points(1,1))/(1+1/2); %posicion X del punto en un lado del rectangulo
        lineaIII (1,2) = (points(2,2)+1/2*points(1,2))/(1+1/2); %posicion Y del punto en un lado del rectangulo
        lineaIII (2,1) = (points(3,1)+1/2*points(4,1))/(1+1/2); %posicion X del punto el otro lado del rectangulo
        lineaIII (2,2) = (points(3,2)+1/2*points(4,2))/(1+1/2); %posicion Y del punto el otro lado del rectangulo
    else
        lineaIII (1,1) = (points(3,1)+1/2*points(4,1))/(1+1/2); %posicion X del punto en un lado del rectangulo
        lineaIII (1,2) = (points(3,2)+1/2*points(4,2))/(1+1/2); %posicion Y del punto en un lado del rectangulo
        lineaIII (2,1) = (points(2,1)+1/2*points(1,1))/(1+1/2); %posicion X del punto el otro lado del rectangulo
        lineaIII (2,2) = (points(2,2)+1/2*points(1,2))/(1+1/2); %posicion Y del punto el otro lado del rectangulo

    end
    
    % línea delimita zona IV 1/4 de la parte trasera del CC ->r=1/3
    lineaIV = zeros(2,2);
    
    if pos==1
        lineaIV (1,1) = (points(2,1)+1/3*points(1,1))/(1+1/3); %posicion X del punto en un lado del rectangulo
        lineaIV (1,2) = (points(2,2)+1/3*points(1,2))/(1+1/3); %posicion Y del punto en un lado del rectangulo
        lineaIV (2,1) = (points(3,1)+1/3*points(4,1))/(1+1/3); %posicion X del punto el otro lado del rectangulo
        lineaIV (2,2) = (points(3,2)+1/3*points(4,2))/(1+1/3); %posicion Y del punto el otro lado del rectangulo
    else
        lineaIV (1,1) = (points(3,1)+1/3*points(4,1))/(1+1/3); %posicion X del punto en un lado del rectangulo
        lineaIV (1,2) = (points(3,2)+1/3*points(4,2))/(1+1/3); %posicion Y del punto en un lado del rectangulo
        lineaIV (2,1) = (points(2,1)+1/3*points(1,1))/(1+1/3); %posicion X del punto el otro lado del rectangulo
        lineaIV (2,2) = (points(2,2)+1/3*points(1,2))/(1+1/3); %posicion Y del punto el otro lado del rectangulo
    end
     % save the lines in a structure data
    
    lines.linea1 = lineaI;
    lines.linea2 = lineaII;
    lines.linea3 = lineaIII;
    lines.linea4 = lineaIV;
    %lines.linea1_plot = lineaI_plot; 

%     if orientation == 1;    
%         
%         % línea delimita zona IV
%         lineaIV = zeros(2,2);
%         lineaIV (1,1) = (points(1,1)+1/4*points(2,1))/(1+1/4); 
%         lineaIV (1,2) = (points(1,2)+1/4*points(2,2))/(1+1/4);
%         lineaIV (2,1) = (points(4,1)+1/4*points(3,1))/(1+1/4);
%         lineaIV (2,2) = (points(4,2)+1/4*points(3,2))/(1+1/4); 
%         
%         % save the change of new lines
%         lines.linea1 = lineaIII;
%         lines.linea3 = lineaI;
%         lines.linea4 = lineaIV;
% 
%     end
end