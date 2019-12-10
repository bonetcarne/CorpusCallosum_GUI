function lines = witelson_div(points)


    % dividimos el cuerpo cayoso
    % dividir el segmento en una razon dada 
    % x = (x2+rx1)/(1+r); y= (y2+ry1)/(1+r); donde si queremos la tercera
    % parte r= 1/2. si queremos la mitad r=1, si queremos la quinta parte
    % r=1/4

    
    % LineaI esta a 1/3 de la parte frontal del CC
     lineaI = zeros(2,2);
     lineaI (1,1) = (points(1,1)+1/2*points(2,1))/(1+1/2); %posicion X del punto en un lado del rectangulo
     lineaI (1,2) = (points(1,2)+1/2*points(2,2))/(1+1/2); %posicion Y del punto en un lado del rectangulo
     lineaI (2,1) = (points(4,1)+1/2*points(3,1))/(1+1/2); %posicion X del punto el otro lado del rectangulo
     lineaI (2,2) = (points(4,2)+1/2*points(3,2))/(1+1/2); %posicion Y del punto el otro la
   
    % línea delimita zona II esta a 1/2 del CC
    lineaII = zeros (2,2);
    lineaII (1,1) = (points(1,1)+points(2,1))/2; 
    lineaII (1,2) = (points(1,2)+points(2,2))/2; 
    lineaII (2,1) = (points(4,1)+points(3,1))/2; 
    lineaII (2,2) = (points(4,2)+points(3,2))/2;

    % línea delimita zona III 1/3 de la parte trasera del CC
    lineaIII = zeros(2,2);
    lineaIII (1,1) = (points(2,1)+1/2*points(1,1))/(1+1/2); %posicion X del punto en un lado del rectangulo
    lineaIII (1,2) = (points(2,2)+1/2*points(1,2))/(1+1/2); %posicion Y del punto en un lado del rectangulo
    lineaIII (2,1) = (points(3,1)+1/2*points(4,1))/(1+1/2); %posicion X del punto el otro lado del rectangulo
    lineaIII (2,2) = (points(3,2)+1/2*points(4,2))/(1+1/2); %posicion Y del punto el otro lado del rectangulo


    % línea delimita zona IV 1/5 de la parte trasera del CC
    lineaIV = zeros(2,2);
    lineaIV (1,1) = (points(2,1)+1/4*points(1,1))/(1+1/4); %posicion X del punto en un lado del rectangulo
    lineaIV (1,2) = (points(2,2)+1/4*points(1,2))/(1+1/4); %posicion Y del punto en un lado del rectangulo
    lineaIV (2,1) = (points(3,1)+1/4*points(4,1))/(1+1/4); %posicion X del punto el otro lado del rectangulo
    lineaIV (2,2) = (points(3,2)+1/4*points(4,2))/(1+1/4); %posicion Y del punto el otro lado del rectangulo

     % save the lines in a structure data
    
    lines.linea1 = lineaI;
    lines.linea2 = lineaII;
    lines.linea3 = lineaIII;
    lines.linea4 = lineaIV;
% 
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