%calculate_values

% resolution parameters
switch mode
    case 0 %mri
        deltaX = Ai.SequenceOfUltrasoundRegions.Item_1.PhysicalDeltaX; % en cm
        deltaY = Ai.SequenceOfUltrasoundRegions.Item_1.PhysicalDeltaY; %en cm
        
    case 1 %review
        
        deltaX = delineated.deltaX;
        deltaY = delineated.deltaY;
                    
    case 2 %mri
        deltaX = Ai.PixelSpacing(1)/10; % parámetro en cm
        deltaY = Ai.PixelSpacing(2)/10; %parámetro en cm
    
end

%% Areas y high
info_Hofer = Hofer_information (new_rectangle,length_line_points,contour, ROI, deltaX,deltaY);
info_Witelson = Witelson_information (new_rectangle,length_line_points,contour,u,ROI, deltaX,deltaY);


%% total length 
 

[xl1,yl1]=polyxpoly(length_line_points(:,1),length_line_points(:,2),[new_rectangle(1,1);new_rectangle(4,1)],[new_rectangle(1,2);new_rectangle(4,2)]);

[xl2,yl2]=polyxpoly(length_line_points(:,1),length_line_points(:,2),new_rectangle(2:3,1),new_rectangle(2:3,2));

long = sqrt(((xl1-xl2)*deltaX)^2+((yl1-yl2)*deltaY)^2);

%% VHigh 1 y VHig2 corte de la length_line con la ROI
[xlr,ylr]=polyxpoly(length_line_points(:,1),length_line_points(:,2),contour(:,1),contour(:,2));

for i = 1:4
    dist_aux(i) = calcula_distancia(new_rectangle(1,:),new_rectangle(4,:),[xlr(i),ylr(i)]);    
end

dist_aux_ord = sort(dist_aux);     

p1 = find (dist_aux == dist_aux_ord(1));
p2 = find (dist_aux == dist_aux_ord(2));
p3 = find (dist_aux == dist_aux_ord(3));
p4 = find (dist_aux == dist_aux_ord(4));

VH1 = [xlr(p1),ylr(p1);xlr(p2),ylr(p2)];
VH2 = [xlr(p3),ylr(p3);xlr(p4),ylr(p4)];  

dist_VH1 = sqrt(((VH1(1,1)-VH1(2,1))*deltaX)^2+((VH1(2,2)-VH1(2,2))*deltaY)^2);
dist_VH2 = sqrt(((VH2(1,1)-VH2(2,1))*deltaX)^2+((VH2(2,2)-VH2(2,2))*deltaY)^2);

%% MOSTRAMOS POR PANTALLA LOS RESULTADOS


 %% put data in the boxes Hofer 2002
 
    set(h1.height1_edit,'String',num2str( info_Hofer.high.linea1));
    set(h1.height2_edit,'String',num2str( info_Hofer.high.linea2));
    set(h1.height3_edit,'String',num2str( info_Hofer.high.linea3));
    set(h1.height4_edit,'String',num2str( info_Hofer.high.linea4));
    set(h1.length_edit,'String',num2str(long));

    set(h1.VHigh1_edit,'String',num2str(dist_VH1));

    set(h1.VHigh2_edit,'String',num2str(dist_VH2));



    set(h1.area1_edit,'String',num2str(info_Hofer.areas.roi1));
    set(h1.area2_edit,'String',num2str(info_Hofer.areas.roi2));
    set(h1.area3_edit,'String',num2str(info_Hofer.areas.roi3));
    set(h1.area4_edit,'String',num2str(info_Hofer.areas.roi4));
    set(h1.area5_edit,'String',num2str(info_Hofer.areas.roi5));
    totalArea = deltaX*deltaY*sum(sum(ROI));
    set(h1.TotalArea1_edit,'String',num2str(totalArea));
    clear totalArea

    set(h1.saveRoi_button,'Enable','on','backgroundColor',[0 0.5 0]);


    %% put data in the boxes WS 1989
   
    set(h1.height11_edit,'String',num2str(info_Witelson.high.linea1));
    set(h1.height12_edit,'String',num2str(info_Witelson.high.linea1));
    set(h1.height13_edit,'String',num2str(info_Witelson.high.linea3));
    set(h1.height14_edit,'String',num2str(info_Witelson.high.linea4));
    set(h1.height15_edit,'String',num2str(info_Witelson.high.linea5));
    set(h1.height16_edit,'String',num2str(info_Witelson.high.linea6));
    set(h1.length12_edit,'String',num2str(long));

    set(h1.VHigh12_edit,'String',num2str(dist_VH1));
    set(h1.VHigh22_edit,'String',num2str(dist_VH2));

    set(h1.area11_edit,'String',num2str(info_Witelson.areas.roi1));
    set(h1.area12_edit,'String',num2str(info_Witelson.areas.roi2));
    set(h1.area13_edit,'String',num2str(info_Witelson.areas.roi3));
    set(h1.area14_edit,'String',num2str(info_Witelson.areas.roi4));
    set(h1.area15_edit,'String',num2str(info_Witelson.areas.roi5));
    set(h1.area16_edit,'String',num2str(info_Witelson.areas.roi6));
    set(h1.area17_edit,'String',num2str(info_Witelson.areas.roi7));

    totalArea = deltaX*deltaY*sum(sum(ROI));
    set(h1.TotalArea12_edit,'String',num2str(totalArea));

    set(h1.saveRoi_button,'Enable','on','backgroundColor',[0 0.5 0]);

    %% guardamos los valores en la variable delineated Hofer 2002
   
    delineated.Hofer_2002.Height1 = str2num(get(h1.height1_edit,'String')); %cm
    delineated.Hofer_2002.Height2 = str2num(get(h1.height2_edit,'String'));
    delineated.Hofer_2002.Height3 = str2num(get(h1.height3_edit,'String'));
    delineated.Hofer_2002.Height4 = str2num(get(h1.height4_edit,'String'));

    delineated.Hofer_2002.VHigh1 = str2num(get(h1.VHigh1_edit,'String'));
    delineated.Hofer_2002.VHigh2 = str2num(get(h1.VHigh2_edit,'String'));

    delineated.Hofer_2002.TotalLength = str2num(get(h1.length_edit,'String'));

    delineated.Hofer_2002.Area1 = str2num(get(h1.area1_edit,'String'));%cm^2
    delineated.Hofer_2002.Area2 = str2num(get(h1.area2_edit,'String'));
    delineated.Hofer_2002.Area3 = str2num(get(h1.area3_edit,'String'));
    delineated.Hofer_2002.Area4 = str2num(get(h1.area4_edit,'String'));
    delineated.Hofer_2002.Area5 = str2num(get(h1.area5_edit,'String'));
    delineated.Hofer_2002.TotalArea = str2num(get(h1.TotalArea1_edit,'String'));
    
    delineated.Hofer_2002.roiI = info_Hofer.masks.roi1;
    delineated.Hofer_2002.roiII = info_Hofer.masks.roi2;
    delineated.Hofer_2002.roiIII = info_Hofer.masks.roi3;
    delineated.Hofer_2002.roiIV = info_Hofer.masks.roi4;
    delineated.Hofer_2002.roiV =info_Hofer.masks.roi5;

    %% guardamos los valores en la variable delineated Witelson 1989

    delineated.Witelson_1989.Height1 = str2num(get(h1.height11_edit,'String')); %cm
    delineated.Witelson_1989.Height2 = str2num(get(h1.height12_edit,'String'));
    delineated.Witelson_1989.Height3 = str2num(get(h1.height13_edit,'String'));
    delineated.Witelson_1989.Height4 = str2num(get(h1.height14_edit,'String'));
    delineated.Witelson_1989.Height5 = str2num(get(h1.height15_edit,'String'));
    delineated.Witelson_1989.Height6 = str2num(get(h1.height16_edit,'String'));


    delineated.Witelson_1989.VHigh1 = str2num(get(h1.VHigh12_edit,'String'));
    delineated.Witelson_1989.VHigh2 = str2num(get(h1.VHigh22_edit,'String'));

    delineated.Witelson_1989.TotalLength = str2num(get(h1.length12_edit,'String'));

    delineated.Witelson_1989.Area1 = str2num(get(h1.area11_edit,'String'));%cm^2
    delineated.Witelson_1989.Area2 = str2num(get(h1.area12_edit,'String'));
    delineated.Witelson_1989.Area3 = str2num(get(h1.area13_edit,'String'));
    delineated.Witelson_1989.Area4 = str2num(get(h1.area14_edit,'String'));
    delineated.Witelson_1989.Area5 = str2num(get(h1.area15_edit,'String'));
    delineated.Witelson_1989.Area6 = str2num(get(h1.area16_edit,'String'));
    delineated.Witelson_1989.Area7 = str2num(get(h1.area17_edit,'String'));

    delineated.Witelson_1989.TotalArea = str2num(get(h1.TotalArea12_edit,'String'));
    
    delineated.Witelson_1989.roiI =  info_Witelson.masks.roi1;
    delineated.Witelson_1989.roiII =  info_Witelson.masks.roi2;
    delineated.Witelson_1989.roiIII =  info_Witelson.masks.roi3;
    delineated.Witelson_1989.roiIV = info_Witelson.masks.roi4;
    delineated.Witelson_1989.roiV =  info_Witelson.masks.roi5;
    delineated.Witelson_1989.roiVI = info_Witelson.masks.roi6;
    delineated.Witelson_1989.roiVII =  info_Witelson.masks.roi7;

    % guardamos ROI, rectangulo que contiene la ROI y la línea de long
    delineated.ROI = ROI;
    delineated.rectangle = new_rectangle;
    delineated.line_length = length_line_points;
    delineated.deltaX = deltaX;
    delineated.deltaY = deltaY;


    %% diferenciamos de si estamos en revisión o en etiquetado para mostrar boton Save Changes

    if mode ~= 1 %etiquetado
        set(h1.validate_button,'Enable','on','backgroundColor',[0 0.5 0]);
    else 
        set(h1.validate_button,'Enable','off','backgroundColor',[0.9922 0.9176 0.7961]);
    end
    
   
    set(h1.restore_button,'Enable','off');
   
    set(h1.plot_div_button,'Visible','on');
    set(h1.plot_div_button,'Enable','on');

%figure(2), imagesc(1.*delineated.Hofer_2002.roiI+2.*delineated.Hofer_2002.roiII+3.*delineated.Hofer_2002.roiIII+4.*delineated.Hofer_2002.roiIV+5.*delineated.Hofer_2002.roiV)
%figure(3), imagesc(delineated.Witelson_1989.roiI+2.*delineated.Witelson_1989.roiII+3.*delineated.Witelson_1989.roiIII+4.*delineated.Witelson_1989.roiIV+5.*delineated.Witelson_1989.roiV+6.*delineated.Witelson_1989.roiVI+7.*delineated.Witelson_1989.roiVII)


