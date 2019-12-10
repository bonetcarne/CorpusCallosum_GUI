% start_delineation
% guardamos la imagen de la gráfica limpia para un futuro guardado

% [ROI,contour]=delineate_region(A,h1);
% set(h1.validate_delineation_button,'Visible','on'); 
    
% set (h1.contrast_button,'enable','off');
% set (h1.ilumination_button,'enable','off');

if select == 1
    
    F = getframe(h1.axes1);
    [ROI,contour]=delineate_region(A,h1);
    set(h1.validate_delineation_button,'Visible','on'); 
    select = 0;

else
%     set (h1.contrast_button,'enable','on');
%     set (h1.ilumination_button,'enable','on');
    
    aux = get(h1.axes1,'Children');
    if length(aux) >= 2
        cla(h1.axes1,'reset')
        if mode == 0
            imagesc(rgb2gray(A),'Parent',h1.axes1);
            colormap(h1.axes1,gray);
            set(h1.axes1,'Visible','off');
        elseif mode == 1
            if strcmpi (aux(1:6),'cc_Us_')
                imagesc(rgb2gray(A),'Parent',h1.axes1); %dibuja imagen Us
            else 
                 imagesc(A,'Parent',h1.axes1); %dibuja imagen MRI
            end

            colormap(h1.axes1,gray);
            set(h1.axes1,'Visible','off');
            
        else 
            imagesc(A,'Parent',h1.axes1);
            colormap(h1.axes1,gray);
    
        end
         
        [ROI,contour]=delineate_region(A,h1);
        set(h1.validate_delineation_button,'Visible','on'); 
        clear aux
    else
        
       
        
        copyobj(aux(end),h1.axes1);

        hold on
     
        [ROI,contour]=delineate_region(A,h1);
        set(h1.validate_delineation_button,'Visible','on'); 
        clear aux
        end

end

  