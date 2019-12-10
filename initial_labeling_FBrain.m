%initial_labeling_FLM_data

close all
clear


hh=FBrain;
h1=guidata(hh);

%initial configuration
set(h1.axes1,'Visible','off', 'DrawMode','normal');
set(h1.uipanel1,'Visible','off');
set(h1.uipanel5,'Visible','off');
set(h1.backward_button,'Visible','off');
set(h1.forward_button,'Visible','off');
set(h1.selectIm_button,'Visible','off');
set(h1.fixRect_button,'Visible','off');
set(h1.roi_button,'Visible','off');
set(h1.type_div_popup,'Visible','off');
set(h1.saveIm_button,'backgroundColor',[ 0.9922 0.9176 0.7961],'enable','off');
set(h1.saveRoi_button,'backgroundColor',[ 0.9922 0.9176 0.7961],'enable','off');
set(h1.save_change_button,'Visible','off');
set(h1.validate_button,'Enable','off','backgroundColor',[ 0.9922 0.9176 0.7961]);
set(h1.cancel_button,'Enable','off','BackgroundColor',[ 0.9922 0.9176 0.7961]);
set(h1.discard_button,'Visible','off','BackgroundColor',[ 0.9922 0.9176 0.7961]);

I1=imread('logo_tmb2.bmp');
i1=imresize(I1, [50 175]);

imshow(i1,'Parent',h1.axes3);
clear I1
clear i1

group_control = 0;
cal_aux = 0;





