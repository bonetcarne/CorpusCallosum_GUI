% select_image


set(h1.uipanel1,'Visible','on');
set(h1.uipanel5,'Visible','on');
set(h1.validate_delineation_button,'Visible','off');
%set(h1.axes2,'Visible','off');
set(h1.fixRect_button,'Enable','off');
set(h1.backward_button,'Enable','off');
set(h1.forward_button,'Enable','off');
set(h1.selectIm_button,'Enable','off');
%set(h1.orientation_button,'Enable','off');

set(h1.roi_button,'Visible','on');
set(h1.roi_button,'Enable','on');

set(h1.saveIm_button,'Enable','on','backgroundColor',[0 0.5 0]);
set(h1.saveRoi_button,'Visible','on','Enable','off');
set(h1.cancel_button,'enable','on','backgroundColor',[0.8706 0.4902 0]);

select = 1;

if mode == 1 % estamos revisando imagenes
    % clear screen
    
    clear_screen;
    %configuration
    set(h1.uipanel1,'Visible','on');
    set(h1.uipanel5,'Visible','on');
    set(h1.contrast_button,'Enable','on');
    set(h1.ilumination_button,'Enable','on');
    set(h1.restore_button,'Enable','on');
    
    clear A Ai aux
    A = delineated.Image;
    Ai = delineated.dcminfo;
    
    aux = get(h1.name_edit,'String');
    if strcmpi (aux(1:6),'cc_Us_')
        imagesc(rgb2gray(A),'Parent',h1.axes1);
    else
        imagesc(A,'Parent',h1.axes1);
    end
    set(h1.axes1,'Visible','off');
    set(h1.validate_button,'Enable','off');
    
    set (h1.save_change_button,'Visible','on','Enable','on','BackgroundColor',[0 0.5 0]);
%     if strcmp(get(h1.group_menu,'String'),'Case')
%         position = 2;
%     else 
%         position = 1;
%     end
  %  set(h1.group_menu,'String',{'Control';'Case'},'Value',position)
    set(h1.discard_button,'Visible','on','Enable','on','BackgroundColor','red');
    set(h1.restore_button,'Enable','on');
    clear position
        
end