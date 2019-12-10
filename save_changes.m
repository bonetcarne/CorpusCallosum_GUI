%save_changes

%%% OJO CREO QUE HAY QUE MODIFICARLO CON LO NUEVO DE HOFER !!!!!

if exist('area')==1;
    
%     aux = get(h1.group_menu,'String');

%     delineated.Group = aux(get(h1.group_menu,'Value'),:);
%     clear aux;
% 
%     delineated.Height1 = str2num(get(h1.height1_edit,'String')); %cm
%     delineated.Height2 = str2num(get(h1.height2_edit,'String'));
%     delineated.Height3 = str2num(get(h1.height3_edit,'String'));
%     delineated.Height4 = str2num(get(h1.height4_edit,'String'));
%     delineated.Long = str2num(get(h1.length_edit,'String')); %cm^2
%     delineated.Area1 = str2num(get(h1.area1_edit,'String'));
%     delineated.Area2 = str2num(get(h1.area2_edit,'String'));
%     delineated.Area3 = str2num(get(h1.area3_edit,'String'));
%     delineated.Area4 = str2num(get(h1.area4_edit,'String'));
%     delineated.Area5 = str2num(get(h1.area5_edit,'String'));
%     var_aux = delineated.NHC; % copia del NHC actual
%  
%     delineated.ROI = ROI;
%     delineated.roiI = mask_ROI.roiI;
%     delineated.roiII = mask_ROI.roiII;
%     delineated.roiIII = mask_ROI.roiIII;
%     delineated.roiIV = mask_ROI.roiIV;
%     delineated.roiV = mask_ROI.roiV;
%     
%     delineated.rectangle = new_rectangle;
%     delineated.line_length = length_line_points;
%     
else
    % si ROI no existe se mantienen los datos de ROI, solo se actualiza el
    % nhc o el Grupo
    
    var_aux = delineated.NHC; % copia del NHC actual
    delineated.NHC = get(h1.nhc_edit,'String'); % guarda en la variable, el campo nhc cambiadp
%     aux = get(h1.group_menu,'String');
%     delineated.Group = aux(get(h1.group_menu,'Value'));
%     clear aux;
    
end

%%guardamos
if strcmpi(delineated.NHC,var_aux) % si el cambiado es igual al antiguo, 
    aux = get(h1.name_edit,'String');
    save(strcat(output_save_path,filesep,aux(1:6),get(h1.nhc_edit,'String'),'.mat'),'delineated')
    clear aux delineated
else % si se ha cambiado el NHC se guarda con el nombre de archivo cambiado y ademas se elimina el archivo anterior
%     delineated.NHC = get(h1.nhc_edit,'String');
    var1 = get(h1.name_edit,'String');
    save(strcat(output_save_path,filesep,var1(1:6),delineated.NHC,'.mat'),'delineated')
    delete (strcat(output_save_path,filesep,var1))
    
    clear var1 delineated
    %% se vuelve a recargar la carpeta con las imagenes y se muestra la imagen siguiente a la borrada
     n_review=dir(strcat(origin_path,filesep,'*.mat'));
     N=length(n_review);
     origin_dir= n_review;
     read_files_on_folder;
     set(h1.total_edit,'String',num2str(N));
end
clear var_aux
% set(h1.selectIm_button,'Visible','on');
if idxFLM == N && idxFLM == 1
    set(h1.forward_button,'Visible','on','Enable','off');
    set(h1.backward_button,'Visible','on','enable','off');
    outmessage ({'There is only one labeled image'});
    
    clear_screen
    fill_fields_matlab_image
    
elseif idxFLM == N
    set(h1.backward_button,'Visible','on','enable','on');
    previous_image;
    
elseif idxFLM == 1
    set(h1.forward_button,'Visible','on','Enable','on');
    next_image;

else
    
    set(h1.forward_button,'Visible','on','Enable','on');
    set(h1.backward_button,'Visible','on','enable','on');
    next_image
end
    
set(h1.save_change_button,'Enable','off','backgroundColor',[0.9922 0.9176 0.7961])
set(h1.cancel_button,'Enable','off','backgroundColor',[0.9922 0.9176 0.7961])  
set(h1.discard_button,'Enable','off','backgroundColor',[0.9922 0.9176 0.7961])

