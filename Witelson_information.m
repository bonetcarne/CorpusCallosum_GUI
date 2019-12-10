function inf_Witelson = Witelson_information (p_rec,line_length,contour,u,ROI, deltaX,deltaY)


%% 1º: Averiguar que línea de las que forman el rectangulo está más cerca a
% la parte superior del CC 
pos = orientacion_CC(ROI, line_length, p_rec); %pos=1 -> es la línea 1-2 si no es la 3-4

%% 2º: Obtenemos las líneas de Witelson
[lines_witelson,G] = witelson_div_1989(p_rec,line_length, contour, u, pos);

%% 3º: Obtenemos los ptos de interseccion entre las lineas de division y el contorno

  
for i = 1: (length(fieldnames(lines_witelson))-1)
    
    if i == 1
           var_name = strcat('linea',num2str(i));

           if pos == 1
               linea_aux = [lines_witelson.linea2(1,:);lines_witelson.linea1(2,:)];
           else 
                linea_aux = [lines_witelson.linea2(2,:);lines_witelson.linea1(1,:)];
           end
            [xi,yi] = polyxpoly(linea_aux(:,1),linea_aux(:,2),contour(:,1),contour(:,2));
        
        if length (xi(:,1)) <4 
              outmessage({strcat('No existe área ',num2str(i))})
        else
           
            ptos_cross =[xi,yi];
            aux2 = diff(ptos_cross);
            distancia.(var_name)= sqrt((aux2(1)*deltaX)^2+(aux2(2)*deltaY)^2); % cm units
            clear ptos_cross aux2  xi yi;
        end
   
    else
         var_name = strcat('linea',num2str(i+1));
        [xi,yi] = polyxpoly(lines_witelson.(var_name)(:,1),lines_witelson.(var_name)(:,2),contour(:,1),contour(:,2));
        ptos_cross =[xi,yi];
        aux2 = diff(ptos_cross);
        distancia.(var_name)= sqrt((aux2(1)*deltaX)^2+(aux2(2)*deltaY)^2); % cm units
        clear ptos_cross aux2  xi yi;
    end
end



%% 4º: Obtener los puntos que conforman los rectangulos que contienen cada una de las áreas

% AREA 1
if pos == 1
    
    a1_p1 =lines_witelson.linea1(1,:);
    
    %pto de corte entre linea divisoria 3 y la de longitud
    [xi,yi]=polyxpoly(lines_witelson.linea3(:,1),lines_witelson.linea3(:,2),line_length(:,1),line_length(:,2));
    a1_p2 = [xi,yi];
    clear xi yi
    
    a1_p3 =lines_witelson.linea3(2,:);
    a1_p4 = lines_witelson.linea1(2,:);
    
  else
     a1_p1 = lines_witelson.linea1(1,:);
     a1_p2 = lines_witelson.linea3(2,:);
     
    %pto de corte entre linea divisoria 3 y la de longitud
    [xi,yi]=polyxpoly(lines_witelson.linea3(:,1),lines_witelson.linea3(:,2),line_length(:,1),line_length(:,2));
    a1_p3 = [xi,yi];
    clear xi yi
     
    
     a1_p4 = lines_witelson.linea1(2,:);
      
    
end
polys.area1 = [a1_p1;a1_p2;a1_p3;a1_p4];
clear a1_p1 a1_p2 a1_p3 a1_p4     
% AREA 2
if pos == 1
    
    a1_p1 = p_rec(1,:);
    a1_p2 = lines_witelson.linea2(1,:);
    a1_p3 = lines_witelson.linea1(2,:);
    a1_p4 = p_rec(4,:);

else
    a1_p1 = p_rec(1,:);
    a1_p2 = lines_witelson.linea1(1,:);
    a1_p3 = lines_witelson.linea2(2,:);
    a1_p4 = p_rec(4,:);

end
polys.area2 = [a1_p1;a1_p2;a1_p3;a1_p4];
 clear xi yi a1_p1 a1_p2 a1_p3 a1_p4

 %AREA 3
if pos == 1
    
    a1_p1 = lines_witelson.linea2(1,:);
    a1_p2 = lines_witelson.linea3(1,:);
    
    [xi,yi]=polyxpoly(lines_witelson.linea3(:,1),lines_witelson.linea3(:,2),line_length(:,1),line_length(:,2));
    a1_p3 = [xi,yi];
    clear xi yi
      
    a1_p4 = lines_witelson.linea2(2,:);

else
    a1_p1 = lines_witelson.linea2(1,:);
    
    [xi,yi]=polyxpoly(lines_witelson.linea3(:,1),lines_witelson.linea3(:,2),line_length(:,1),line_length(:,2));
    a1_p2 = [xi,yi];
    clear xi yi
    
    a1_p3 = lines_witelson.linea3(1,:);
    a1_p4 = lines_witelson.linea2(2,:);

end
 
 
polys.area3 = [a1_p1;a1_p2;a1_p3;a1_p4];

polys.area4 = [lines_witelson.linea3;lines_witelson.linea4(2,:);lines_witelson.linea4(1,:)];

polys.area5 = [lines_witelson.linea4;lines_witelson.linea5(2,:);lines_witelson.linea5(1,:)];

polys.area6 = [lines_witelson.linea5;lines_witelson.linea6(2,:);lines_witelson.linea6(1,:)];

if pos == 1
    polys.area7 = [lines_witelson.linea6;p_rec(3,:);p_rec(2,:)];
else
    polys.area7 = [lines_witelson.linea6;p_rec(2,:);p_rec(3,:)];
end

% 4º Obtenemos las ROIs
nrows = size(ROI,1); 
ncols = size (ROI,2);
ydata = double([1 nrows]);
xdata = double([1 ncols]);
f_names = fieldnames(polys);

for i=1:length(f_names)
    rot_pto = polys.(f_names{i});
    roix = axes2pix(ncols,xdata,rot_pto(:,1));
    roiy = axes2pix(nrows,ydata,rot_pto(:,2));

    % close the polygon
    roix = [roix;roix(1)];
    roiy = [roiy; roiy(1)];

    % create a mask
    name_var = strcat ('roi',num2str(i));
    mask_ROI.(name_var) = poly2mask(roix,roiy,nrows,ncols).*ROI;
    numel_pix = regionprops (mask_ROI.(name_var),'Area');
    area.(name_var)=deltaX*deltaY*numel_pix.Area;
    
    clear rot_pto roix roiy name_var numel_pix
end

inf_Witelson.lines = lines_witelson;
inf_Witelson.rect_delimitador = polys;
inf_Witelson.masks = mask_ROI;
inf_Witelson.areas = area;
inf_Witelson.high =distancia;



