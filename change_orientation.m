
if orientation == 0
    orientation = 1;
else 
    orientation = 0;
end
lines = witelson_div(new_rectangle,orientation);

if orientation == 0
    
    imagesc(A,'Parent',h1.axes1);
    colormap(h1.axes1,gray);
    hold on 
    axes(h1.axes1)
    plot(contour(:,1),contour(:,2),'y-');
   % plot ([points_rect(:,1);points_rect(1,1)],[points_rect(:,2);points_rect(1,2)],'-r');
    plot ([new_rectangle(:,1);new_rectangle(1,1)],[new_rectangle(:,2);new_rectangle(1,2)],'-r');
     
    plot(lines.linea1(:,1),lines.linea1(:,2),'-')
    plot(lines.linea2(:,1),lines.linea2(:,2),'-')
    plot(lines.linea3(:,1),lines.linea3(:,2),'-')
    plot(lines.linea4(:,1),lines.linea4(:,2),'-')
else
    
    imagesc(A,'Parent',h1.axes1);
    colormap(h1.axes1,gray);
    hold on
    axes (h1.axes1)
    plot(contour(:,1),contour(:,2),'-y');
  % plot ([points_rect(:,1);points_rect(1,1)],[points_rect(:,2);points_rect(1,2)],'-r');
     plot ([new_rectangle(:,1);new_rectangle(1,1)],[new_rectangle(:,2);new_rectangle(1,2)],'-r');
    
    plot(lines.linea1(:,1),lines.linea1(:,2),'-m')
    plot(lines.linea2(:,1),lines.linea2(:,2),'-m')
    plot(lines.linea3(:,1),lines.linea3(:,2),'-m')
    plot(lines.linea4(:,1),lines.linea4(:,2),'-m')
end

