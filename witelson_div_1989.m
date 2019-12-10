function [lines,G] = witelson_div_1989(points,length_line_points,contour,u,pos)

    %7 aŕeas
    %G es el punto definido en el artículo: The perpendicular dropped
    %through the anteriormost point of the inner convexity of the anterior callosum (point G in fig. 1)
    
    [x_length,y_length] = polyxpoly(contour(:,1),contour(:,2),length_line_points(:,1),length_line_points(:,2));
    
    dist_aux = zeros(4,1);
     
    for i = 1:4
     
            [dist_aux(i),xx] = calcula_distancia(points(1,:),points(4,:),[x_length(i),y_length(i)]);
           
    end
    dist_aux_ord = sort(dist_aux);     
    p_value = dist_aux_ord(2);
    p = find (dist_aux == p_value);
      
    G = [x_length(p), y_length(p)]; %esto puede variar buscar la forma de decir que sean los puntos contenido en el aréa I
   % plot(G(1),G(2),'-w*')
    
    clear dist_aux_ord p_value p
    
    [dist_G_ACC, uG] = calcula_distancia(points(1,:),points(4,:),G);
    
    %línea perpendicular a la longitud que pasa por el punto G
    
    linea_aux= [points(1,:)+u(1,:)*dist_G_ACC;points(4,:)+u(1,:)*dist_G_ACC];
   
   
    if pos == 1
        
        lineaI = [G;linea_aux(2,:)];
        lineaII = [linea_aux(1,:);G];
    else 
        
        lineaI = [linea_aux(1,:);G];
        lineaII = [G;linea_aux(2,:)];
    end
    
    
    
    % dividimos el cuerpo cayoso
    % dividir el segmento en una razon dada 
    % x = (x2+rx1)/(1+r); y= (y2+ry1)/(1+r); donde si queremos la tercera
    % parte r= 1/2. si queremos la mitad r=1, si queremos la quinta parte
    % r=1/4

    
    % LineaIII esta a 1/3 de la parte frontal del CC
    lineaIII = zeros(2,2);
    if pos == 1
              
        lineaIII (1,1) = (points(1,1)+1/2*points(2,1))/(1+1/2); %posicion X del punto en un lado del rectangulo
        lineaIII (1,2) = (points(1,2)+1/2*points(2,2))/(1+1/2); %posicion Y del punto en un lado del rectangulo
        lineaIII (2,1) = (points(4,1)+1/2*points(3,1))/(1+1/2); %posicion X del punto el otro lado del rectangulo
        lineaIII (2,2) = (points(4,2)+1/2*points(3,2))/(1+1/2); %posicion Y del punto el otro la
    
    else
        lineaIII (1,1) = (points(4,1)+1/2*points(3,1))/(1+1/2); %posicion X del punto en un lado del rectangulo
        lineaIII (1,2) = (points(4,2)+1/2*points(3,2))/(1+1/2); %posicion Y del punto en un lado del rectangulo
        lineaIII (2,1) = (points(1,1)+1/2*points(2,1))/(1+1/2); %posicion X del punto el otro lado del rectangulo
        lineaIII (2,2) = (points(1,2)+1/2*points(2,2))/(1+1/2); %posicion Y del punto el otro la
    
    end
        
   %  plot(lineaIV(:,1),lineaIV(:,2),'-w*')
    % línea delimita zona IV esta a 1/2 del CC
    lineaIV = zeros (2,2);
    if pos == 1
        lineaIV (1,1) = (points(1,1)+points(2,1))/2; 
        lineaIV (1,2) = (points(1,2)+points(2,2))/2; 
        lineaIV (2,1) = (points(4,1)+points(3,1))/2; 
        lineaIV (2,2) = (points(4,2)+points(3,2))/2;
    else
        lineaIV (1,1) = (points(4,1)+points(3,1))/2; 
        lineaIV (1,2) = (points(4,2)+points(3,2))/2; 
        lineaIV (2,1) = (points(1,1)+points(2,1))/2; 
        lineaIV (2,2) = (points(1,2)+points(2,2))/2;    
    end
    
    % línea delimita zona 5 1/3 de la parte trasera del CC
    lineaV = zeros(2,2);
    if pos == 1
        lineaV (1,1) = (points(2,1)+1/2*points(1,1))/(1+1/2); %posicion X del punto en un lado del rectangulo
        lineaV (1,2) = (points(2,2)+1/2*points(1,2))/(1+1/2); %posicion Y del punto en un lado del rectangulo
        lineaV (2,1) = (points(3,1)+1/2*points(4,1))/(1+1/2); %posicion X del punto el otro lado del rectangulo
        lineaV (2,2) = (points(3,2)+1/2*points(4,2))/(1+1/2); %posicion Y del punto el otro lado del rectangulo
    else
         lineaV (1,1) = (points(3,1)+1/2*points(4,1))/(1+1/2); %posicion X del punto en un lado del rectangulo
        lineaV (1,2) = (points(3,2)+1/2*points(4,2))/(1+1/2); %posicion Y del punto en un lado del rectangulo
        lineaV (2,1) = (points(2,1)+1/2*points(1,1))/(1+1/2); %posicion X del punto el otro lado del rectangulo
        lineaV (2,2) = (points(2,2)+1/2*points(1,2))/(1+1/2); %posicion Y del punto el otro lado del rectangulo
    end

    % línea delimita zona 6 1/5 de la parte trasera del CC
    lineaVI = zeros(2,2);
    if pos == 1
    
        lineaVI (1,1) = (points(2,1)+1/4*points(1,1))/(1+1/4); %posicion X del punto en un lado del rectangulo
        lineaVI (1,2) = (points(2,2)+1/4*points(1,2))/(1+1/4); %posicion Y del punto en un lado del rectangulo
        lineaVI (2,1) = (points(3,1)+1/4*points(4,1))/(1+1/4); %posicion X del punto el otro lado del rectangulo
        lineaVI (2,2) = (points(3,2)+1/4*points(4,2))/(1+1/4); %posicion Y del punto el otro lado del rectangulo
    else
        lineaVI (1,1) = (points(3,1)+1/4*points(4,1))/(1+1/4); %posicion X del punto en un lado del rectangulo
        lineaVI (1,2) = (points(3,2)+1/4*points(4,2))/(1+1/4); %posicion Y del punto en un lado del rectangulo
        lineaVI (2,1) = (points(2,1)+1/4*points(1,1))/(1+1/4); %posicion X del punto el otro lado del rectangulo
        lineaVI (2,2) = (points(2,2)+1/4*points(1,2))/(1+1/4); %posicion Y del punto el otro lado del rectangulo
    end
     % save the lines in a structure data
    lines.linea1 = lineaI;
    lines.linea2 = lineaII;
    lines.linea3 = lineaIII;
    lines.linea4 = lineaIV;
    lines.linea5 = lineaV;
    lines.linea6 = lineaVI;
   end