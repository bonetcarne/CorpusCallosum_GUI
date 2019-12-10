%fix_rect
set(h1.plot_div_button,'Enable','off');
if exist ('rectangle')==1
    
    cla(h1.axes1,'reset')
    imagesc(A,'Parent',h1.axes1);
    hold on
    axes(h1.axes1)
    plot(contour(:,1),contour(:,2),'-y');
    clear info_Hofer info_Witelson
          
end

set(h1.roi_button,'Enable','off')
set(h1.validate_delineation_button,'Visible','off')
set(h1.fixRect_button,'Enable','off')
set(h1.calculate_button,'Enable','on');



outmessage({'Put the blue circle at the position A of Witelson Scheme'})

set(h1.axes1,'Visible','off');
hold on

%%% plotear el rectangulo

[rectangle,points_rect] = rotation(A,h1,false);

orientation = 0; % blue circle is in the A position of the Witelson's Scheme


%%% ajustar el rectangulo a la ROI

% se mide la distancia de cada uno de los lados del rectangulo a cada uno de los puntos
% que forman el contorno de la ROI (contour)

p_min_dist = zeros (4,2);
u = zeros (4,2);
distancias =zeros(4,1);


for j=1:4

    dist = zeros(1,size(contour,1));

    if j~=4
         
        for i=1:size(contour,1)

           [dist(i),u(j,:)] = calcula_distancia (points_rect(j,:),points_rect(j+1,:),contour(i,:));     
        
        end
    else 
       % v_dir (j) = [points_rect(j,1)-points_rect(1,1), points_rect(j,2)-points_rect(1,2)];
        
        for i=1:size(contour,1)

           [dist(i),u(j,:)] = calcula_distancia (points_rect(j,:),points_rect(1,:),contour(i,:));     
        end
    end
    
    
    [aux_value,aux_pos] = min (dist);
    p_min_dist (j,:)= contour(aux_pos,:);
    distancias(j) = aux_value;
end

%% BORRAR LUEGO
%plot(p_min_dist(1,1),p_min_dist(1,2),'-g*')
%plot(p_min_dist(2,1),p_min_dist(2,2),'-g*')
%plot(p_min_dist(3,1),p_min_dist(3,2),'-g*')
%plot(p_min_dist(4,1),p_min_dist(4,2),'-g*')
%%
new_rectangle = zeros(4,2);
distancias = [distancias(4,1);distancias(1:3,1)]; % cambiamos para que las distancias sean (d4,d1,d2,d3)
%distancias
%u
for j=1:4
    
    if j~=4
        aux_2 =points_rect(j,:)+u(j,:)*distancias(j,1);
        new_rectangle(j,:)=aux_2+u(j+1,:)*distancias(j+1,1);
       % plot(new_rectangle(j,1), new_rectangle(j,2),'-g*');
    else
        aux_2 =points_rect(j,:)+u(j,:)*distancias(j,1);
        new_rectangle(j,:)=aux_2+u(1,:)*distancias(1,1); 
       % plot(new_rectangle(j,1), new_rectangle(j,2),'-g*');
    
    end
             
end

%Se envía al fondo el rectangulo de Witelson MODIFICAR porque si se pulsa
%de nuevo Strat Delineation no se muestra bien.

chH = get(gca,'Children');
set(gca,'Children', [chH(end-1);chH(end);chH(1:end-2)]);


plot([new_rectangle(1,1) new_rectangle(2,1)] ,[new_rectangle(1,2) new_rectangle(2,2)], 'b','LineWidth',2)
plot([new_rectangle(2,1) new_rectangle(3,1)] ,[new_rectangle(2,2) new_rectangle(3,2)], 'b','LineWidth',2)
plot([new_rectangle(3,1) new_rectangle(4,1)] ,[new_rectangle(3,2) new_rectangle(4,2)], 'b','LineWidth',2)
plot([new_rectangle(4,1) new_rectangle(1,1)] ,[new_rectangle(4,2) new_rectangle(1,2)], 'b','LineWidth',2)

%% comprobamos que todos los puntos de la ROI estan contenidos en el rectangulo
sum_ROI = sum(sum(ROI));
nrows = size(A,1); 
ncols = size (A,2);
ydata = double([1 nrows]);
xdata = double([1 ncols]);

rot_pto = [points_rect(4,:);points_rect(1,:);points_rect(2,:);points_rect(3,:)];
roix = axes2pix(ncols,xdata,rot_pto(:,1));
roiy = axes2pix(nrows,ydata,rot_pto(:,2));

maska = poly2mask(roix,roiy,nrows,ncols).*ROI;
sum_mask= sum(sum(maska));

if sum_ROI ~=sum_mask % no hemos recuadrado toda la ROI
    outmessage ({'Fix the rectangle again, it does not contain all the ROI'});
    cla(h1.axes1,'reset')
    imagesc (A,'Parent',h1.axes1);
    hold on
    plot(contour(:,1),contour(:,2),'y-');
    clear points_rect rectangle
    set(h1.fixRect_button,'enable','on');
    %break
    return
end

%% LINEA QUE SE PUEDE MOVER PARA INDICAR LA LONGUITUD DEL CC
flag = 'True';

while flag
    
    h = imline(h1.axes1, points_rect(1:2,1), points_rect(1:2,2));
    cbl_h = iptgetapi(h);
    pause
    length_line_points = cbl_h.getPosition;
    [x_length,y_length] = polyxpoly(contour(:,1),contour(:,2),length_line_points(:,1),length_line_points(:,2));
    
    if  length(x_length(:,1)) ~=4
        cbl_h.delete;
        flag ='true';
    else
        break
    end
end


set(h1.fixRect_button,'Enable','on');
% set(h1.plot_div_button,'Enable','on');

set(h1.type_div_popup,'Visible','on');
%set (h1.orientation_button,'Enable','on');
set(h1.calculate_button,'Visible','on');






