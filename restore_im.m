%restore_im
   
if mode == 0
    hold off
    imagesc(rgb2gray(A),'Parent',h1.axes1);
    colormap(h1.axes1,gray);
    
    
elseif mode == 1 %review
    hold off
    clear aux
    aux = get(h1.name_edit,'String');
    

    if strcmpi (aux(1:6),'cc_Us_')
       imagesc(rgb2gray(A),'Parent',h1.axes1);
    else
       imagesc(A,'Parent',h1.axes1);
    end
    
elseif mode==2 % 
    hold off
    imagesc(A,'Parent',h1.axes1);
    colormap(h1.axes1,gray);  

end

set(h1.axes1,'Visible','off');