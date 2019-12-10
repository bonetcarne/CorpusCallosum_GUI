%DIBUJAR LINEAS

values = get(h1.type_div_popup,'String');
posicion = get(h1.type_div_popup,'Value');




if strcmp(values(posicion), 'Witelson_1989')
    %Dibujar Witelson 1989
    
    % dibujamos imagen
    
    if strcmp(Ai.Modality,'MR')
        imagesc(A,'Parent',h1.axes1);
        colormap(h1.axes1,gray);
    else
        imagesc(rgb2gray(A),'Parent',h1.axes1);
        colormap(h1.axes1,gray);
    end
    
    %dibujamos ROI
    plot(h1.axes1,contour(:,1),contour(:,2),'-y')
    
    %dibujamos rectangulo
    plot(h1.axes1,[new_rectangle(1,1) new_rectangle(2,1)] ,[new_rectangle(1,2) new_rectangle(2,2)], 'b','LineWidth',2)
    plot(h1.axes1,[new_rectangle(2,1) new_rectangle(3,1)] ,[new_rectangle(2,2) new_rectangle(3,2)], 'b','LineWidth',2)
    plot(h1.axes1,[new_rectangle(3,1) new_rectangle(4,1)] ,[new_rectangle(3,2) new_rectangle(4,2)], 'b','LineWidth',2)
    plot(h1.axes1,[new_rectangle(4,1) new_rectangle(1,1)] ,[new_rectangle(4,2) new_rectangle(1,2)], 'b','LineWidth',2)

    %dibujamos la línea larga
    plot(h1.axes1,length_line_points(:,1),length_line_points(:,2),'-w');
    
    %dibujamos las divisiones
    plot(h1.axes1,info_Witelson.lines.linea1(:,1),info_Witelson.lines.linea1(:,2),'-g','LineWidth',2);
    plot(h1.axes1,info_Witelson.lines.linea2(:,1),info_Witelson.lines.linea2(:,2),'-g','LineWidth',2);
    plot(h1.axes1,info_Witelson.lines.linea3(:,1),info_Witelson.lines.linea3(:,2),'-g','LineWidth',2);
    plot(h1.axes1,info_Witelson.lines.linea4(:,1),info_Witelson.lines.linea4(:,2),'-g','LineWidth',2);
    plot(h1.axes1,info_Witelson.lines.linea5(:,1),info_Witelson.lines.linea5(:,2),'-g','LineWidth',2);
    plot(h1.axes1,info_Witelson.lines.linea6(:,1),info_Witelson.lines.linea6(:,2),'-g','LineWidth',2);
    
else
    % Dibujar las de Hofer 2002
   
     % dibujamos imagen
    
    if strcmp(Ai.Modality,'MR')
        imagesc(A,'Parent',h1.axes1);
        colormap(h1.axes1,gray);
    else
        imagesc(rgb2gray(A),'Parent',h1.axes1);
        colormap(h1.axes1,gray);
    end
    
    %dibujamos rectangulo
    plot(h1.axes1,[new_rectangle(1,1) new_rectangle(2,1)] ,[new_rectangle(1,2) new_rectangle(2,2)], 'b','LineWidth',2)
    plot(h1.axes1,[new_rectangle(2,1) new_rectangle(3,1)] ,[new_rectangle(2,2) new_rectangle(3,2)], 'b','LineWidth',2)
    plot(h1.axes1,[new_rectangle(3,1) new_rectangle(4,1)] ,[new_rectangle(3,2) new_rectangle(4,2)], 'b','LineWidth',2)
    plot(h1.axes1,[new_rectangle(4,1) new_rectangle(1,1)] ,[new_rectangle(4,2) new_rectangle(1,2)], 'b','LineWidth',2)

    %dibujamos ROI
    plot(h1.axes1,contour(:,1),contour(:,2),'-y')
    
    %dibujamos la línea de longitud
    plot(h1.axes1,length_line_points(:,1),length_line_points(:,2),'-w');
    
    % plot lines
    plot(h1.axes1,info_Hofer.lines.linea1(:,1),info_Hofer.lines.linea1(:,2),'-c','LineWidth',2);
    plot(h1.axes1,info_Hofer.lines.linea2(:,1),info_Hofer.lines.linea2(:,2),'-c','LineWidth',2);
    plot(h1.axes1,info_Hofer.lines.linea3(:,1),info_Hofer.lines.linea3(:,2),'-c','LineWidth',2);
    plot(h1.axes1,info_Hofer.lines.linea4(:,1),info_Hofer.lines.linea4(:,2),'-c','LineWidth',2);
   
end

