%clear_screen

% type_mode = mode;
% if type_mode ~= 1
%     set(h1.nhc_edit,'String','');
%      set(h1.name_edit,'String','');
%     
% end


%set(h1.group_menu,'String',{'Control';'Case'},'Value',1,'backgroundColor','White') ;
%group_control=0;
set(h1.height1_edit,'String','');
set(h1.height2_edit,'String','');
set(h1.height3_edit,'String','');
set(h1.height4_edit,'String','');
set(h1.length_edit,'String','');
set(h1.area1_edit,'String','');
set(h1.area2_edit,'String','');
set(h1.area3_edit,'String','');
set(h1.area4_edit,'String','');
set(h1.area5_edit,'String','');
set(h1.nhc_edit,'String','');
set(h1.height11_edit,'String','');
set(h1.height12_edit,'String','');
set(h1.height13_edit,'String','');
set(h1.height14_edit,'String','');
set(h1.height15_edit,'String','');
set(h1.height16_edit,'String','');
set(h1.length12_edit,'String','');

set(h1.VHigh12_edit,'String','');
set(h1.VHigh22_edit,'String','');
set(h1.VHigh1_edit,'String','');
set(h1.VHigh2_edit,'String','');
set(h1.area11_edit,'String','');
set(h1.area12_edit,'String','');
set(h1.area13_edit,'String','');
set(h1.area14_edit,'String','');
set(h1.area15_edit,'String','');
set(h1.area16_edit,'String','');
set(h1.area17_edit,'String','');

set(h1.TotalArea12_edit,'String','');
set(h1.TotalArea1_edit,'String','');
   
%limpiar axes

axes(h1.axes1); cla reset
%set(h1.axes2,'Visible','off');
%axes(h1.axes2); cla reset

set(h1.saveRoi_button,'enable','off','backgroundColor',[0.9922 0.9176 0.7961]);
set(h1.saveIm_button,'enable','off','backgroundColor',[0.9922 0.9176 0.7961]);
set(h1.plot_div_button,'enable','off','backgroundColor',[0.9922 0.9176 0.7961]);

set(h1.uipanel1,'Visible','off');
set(h1.uipanel5,'Visible','off');
if  exist('mode','var')
    if mode == 2
        set(h1.name_edit,'String','');
        set(h1.num_edit,'String','');
        set(h1.total_edit,'String','');
    end
end


