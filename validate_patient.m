%validate_patient

if isempty(get(h1.nhc_edit, 'string')) 
    outmessage ({'Insert the NHC number to validate'});
    return
end

% if group_control ~= 1
%     outmessage ({'Insert the GROUP of the patient to validate'});
%     break
% end

if cal_aux ~= 1
    outmessage ({'Press the CALCULATE PARAMETERS button'});
    return
end

delineated.Image = A;
delineated.dcminfo = Ai;
delineated.NHC = get(h1.nhc_edit,'String');
%aux = get(h1.group_menu,'String');
%delineated.Group = aux(get(h1.group_menu,'Value'),:);
clear aux;


%% pedir donde quiere guardalo 
if mode == 0
    save(strcat(output_save_path,filesep,'cc_Us_',num2str(delineated.NHC),'.mat'),'delineated');
elseif mode == 2
    save(strcat(output_save_path,filesep,'cc_MR_',num2str(delineated.NHC),'.mat'),'delineated');
end


%% limpiar pantalla
clear_screen
set(h1.axes1,'Visible','off');

%% eliminamos las variables que no hacen falta

clear deltaX deltaY 


%% limpiamos las variables
clear distancia distancia_v7 dist_VH1 dist_VH2 dist_aux new_rectangle p1 p2 p3 p4 p_min_dist pto1 pto3 pto4 totalArea x_length y_length xl1 xl2 xlr lines7div dist_aux_ord mask_ROI mask_v7_ROI masrectangle length_line_points long intersection ROI sum_mask sum_ROI points_rect maska  contour lines area

set(h1.validate_button,'enable','off','backgroundColor',[0.9922 0.9176 0.7961]);

set(h1.cancel_button,'enable','off','backgroundColor',[0.9922 0.9176 0.7961]);
  
 set(h1.uipanel5,'Visible','off');
  set(h1.fixRect_button,'Enable','off');
  set(h1.calculate_button,'Enable','off');  
  set(h1.plot_div_button,'Enable','off');
  
  clear delineated
